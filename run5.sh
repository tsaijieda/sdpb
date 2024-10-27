list=(25.0 33.0 50.0)
spinlist=(0 1 0.1 0.25 0.5 2)
#rm -rf inter_result.txt
for ((j = 0; j < ${#spinlist[@]}; j++))
do
for ((i = 0; i < ${#list[@]}; i++)) 
    do
        echo "Start process"
        #rm -rf  sdp.zip.ck  sdp.zip_out  sdp.zip  division.txt result.txt

        mu=${list[i]}
	spin0=${spinlist[j]}

        python3 change.py range.txt $mu -1 $spin0

        echo "Generating xml file"
        wolframscript -file extremal_range_spin0.m

        echo "Turning xml to sdp file"
        docker run --shm-size=4096m -v /home/string-12/sdpb:/data bootstrapcollaboration/sdpb:master pmp2sdp 1024 -i /data/out.json -o /data/out

	echo "Running sdpb"
        docker run --shm-size=4096m -v /home/string-12/sdpb:/data bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 32 sdpb --precision=1024 --procsPerNode=32 --maxIterations=5000 -s /data/out
	
	touch spin0/spin0_result_"$j".txt
        
	python3 store_result.py out/out.txt spin0/spin0_result_"$j".txt

        #rm -rf upper_spectrum 

        #cp -rf sdp.zip_out upper_spectrum  

        #rm -rf sdp.zip.ck  sdp.zip_out  sdp.zip
    done
done

