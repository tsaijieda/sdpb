list=(1.0 1.3 2.0 3.0 5.0 10.0)
spinlist=(1.0 0.5)
dir=$(pwd)
echo "$dir"
#rm -rf inter_result.txt
for ((j = 0; j < ${#spinlist[@]}; j++))
do
for ((i = 0; i < ${#list[@]}; i++)) 
    do
        echo "Start process"
	rm -r out.ck
        #rm -rf  sdp.zip.ck  sdp.zip_out  sdp.zip  division.txt result.txt

        mu=${list[i]}
	spin0=${spinlist[j]}

        python3 change.py range.txt $mu -1 $spin0

        echo "Generating xml file"
        wolframscript -file extremal_range_spin0.m

        echo "Turning xml to sdp file"
        docker run --shm-size=4096m -v "$dir":/data bootstrapcollaboration/sdpb:master pmp2sdp 1024 -i /data/out.json -o /data/out

	echo "Running sdpb"
        docker run --shm-size=4096m -v "$dir":/data bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 48 sdpb --precision=1024 --procsPerNode=32 --maxIterations=5000 -s /data/out
	
	touch spin0/spin0_result_"$j".txt
        
	python3 store_result.py out_out/out.txt spin0/spin0_result_0_"$j".txt

        #rm -rf upper_spectrum 

        #cp -rf sdp.zip_out upper_spectrum  

        #rm -rf sdp.zip.ck  sdp.zip_out  sdp.zip
    done
done

