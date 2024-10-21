spin=2

index=0

while [ -s division.txt ]; do
    
    rm -rf  ~/Desktop/物理/sdpb/test4/sdp.zip.ck  ~/Desktop/物理/sdpb/test4/sdp.zip_out  ~/Desktop/物理/sdpb/test4/sdp.zip
 
    index=$((index+1))

    echo "$index iteration"

    python3 copy2.py division.txt result.txt

    python3 change.py range.txt $spin 1 

    echo "Generating xml file"
    wolframscript -file ~/Desktop/物理/sdpb/test4/scalar.m

    echo "Turning xml to sdp file"
    docker run --platform linux/amd64 -v ~/Desktop/物理/sdpb/test4:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 pvm2sdp 1024  /usr/local/share/sdpb/new.xml /usr/local/share/sdpb/sdp.zip

    echo "Running sdpb"
    docker run --platform linux/amd64 -v ~/Desktop/物理/sdpb/test4:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 sdpb --precision=1024 --procsPerNode=4 --checkpointInterval=500 --infeasibleCenteringParameter=0.01 --dualityGapThreshold=1e-15 --dualErrorThreshold=1e-15 --primalErrorThreshold=1e-15 -s /usr/local/share/sdpb/sdp.zip
    
    python3 copy_2.py sdp.zip_out/out.txt result.txt

    cp -r ~/Desktop/物理/sdpb/test4/sdp.zip_out ~/Desktop/物理/sdpb/test4/spectrum_lower_"$index"
    
    rm -rf  ~/Desktop/物理/sdpb/test4/sdp.zip.ck  ~/Desktop/物理/sdpb/test4/sdp.zip_out  ~/Desktop/物理/sdpb/test4/sdp.zip

    python3 change.py range.txt $spin -1

    echo "Generating xml file"
    wolframscript -file ~/Desktop/物理/sdpb/test4/scalar.m

    echo "Turning xml to sdp file"
    docker run --platform linux/amd64 -v ~/Desktop/物理/sdpb/test4:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 pvm2sdp 1024  /usr/local/share/sdpb/new.xml /usr/local/share/sdpb/sdp.zip

    echo "Running sdpb"
    docker run --platform linux/amd64 -v ~/Desktop/物理/sdpb/test4:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 sdpb --precision=1024 --procsPerNode=4 --checkpointInterval=500 --infeasibleCenteringParameter=0.01 --dualityGapThreshold=1e-15 --dualErrorThreshold=1e-15 --primalErrorThreshold=1e-15 -s /usr/local/share/sdpb/sdp.zip

    python3 copy_2.py sdp.zip_out/out.txt result.txt
    
    cp -r ~/Desktop/物理/sdpb/test4/sdp.zip_out ~/Desktop/物理/sdpb/test4/spectrum_higher_"$index"
 
    python3 remove.py division.txt
done
