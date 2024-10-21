list=(10.0 15.0)

rm -rf ~/Desktop/物理/sdpb/test4/inter_result.txt

for ((i = 0; i < ${#list[@]}; i++)) 
    do
        echo "Start process"
        rm -rf  ~/Desktop/物理/sdpb/test4/sdp.zip.ck  ~/Desktop/物理/sdpb/test4/sdp.zip_out  ~/Desktop/物理/sdpb/test4/sdp.zip  ~/Desktop/物理/sdpb/test4/division.txt ~/Desktop/物理/sdpb/test4/result.txt

        mu=${list[i]}

        python3 change.py range.txt $mu -1

        echo "Generating xml file"
        wolframscript -file ~/Desktop/物理/sdpb/test4/extremal_range.m

        echo "Turning xml to sdp file"
        docker run --platform linux/amd64 -v ~/Desktop/物理/sdpb/test4:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 pvm2sdp 1024  /usr/local/share/sdpb/new.xml /usr/local/share/sdpb/sdp.zip

        echo "Running sdpb"
        docker run --platform linux/amd64 -v ~/Desktop/物理/sdpb/test4:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 sdpb --precision=1024 --procsPerNode=4 --checkpointInterval=500 --infeasibleCenteringParameter=0.01 --dualityGapThreshold=1e-15 --maxIterations=1000 --dualErrorThreshold=1e-20 --primalErrorThreshold=1e-20 -s /usr/local/share/sdpb/sdp.zip

        python3 store_result.py sdp.zip_out/out.txt inter_result.txt

        rm -rf ~/Desktop/物理/sdpb/test4/upper_spectrum 

        cp -r ~/Desktop/物理/sdpb/test4/sdp.zip_out ~/Desktop/物理/sdpb/test4/upper_spectrum  

        rm -rf  ~/Desktop/物理/sdpb/test4/sdp.zip.ck  ~/Desktop/物理/sdpb/test4/sdp.zip_out  ~/Desktop/物理/sdpb/test4/sdp.zip
    done


