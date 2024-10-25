list=(7.0 10.0 15.0)

#rm -rf inter_result.txt

for ((i = 0; i < ${#list[@]}; i++)) 
    do
        echo "Start process"
        #rm -rf  sdp.zip.ck  sdp.zip_out  sdp.zip  division.txt result.txt

        mu=${list[i]}

        python3 change.py range.txt $mu -1

        echo "Generating xml file"
        wolframscript -file extremal_range.m

        echo "Turning xml to sdp file"
        docker run -v /home/string-12/sdpb:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master pmp2sdp 1024 -i /usr/local/share/sdpb/new.xml -o /usr/local/share/sdpb/sdp.zip

	echo "Running sdpb"
        docker run -v /home/string-12/sdpb:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 sdpb --precision=1024 --procsPerNode=8 --checkpointDir=false --checkpointInterval=500 --infeasibleCenteringParameter=0.01 --maxSharedMemory=128G --dualityGapThreshold=1e-15 --maxIterations=1000 --dualErrorThreshold=1e-20 --primalErrorThreshold=1e-20 -s /usr/local/share/sdpb/sdp.zip

        python3 store_result.py sdp.zip_out/out.txt inter_result.txt

        #rm -rf upper_spectrum 

        #cp -rf sdp.zip_out upper_spectrum  

        #rm -rf sdp.zip.ck  sdp.zip_out  sdp.zip
    done


