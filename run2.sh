echo "Start process"
rm -rf  ~/Desktop/物理/sdpb/test4/sdp.zip.ck  ~/Desktop/物理/sdpb/test4/sdp.zip_out  ~/Desktop/物理/sdpb/test4/sdp.zip

echo "Generating xml file"
wolframscript -file ~/Desktop/物理/sdpb/test4/scalar_range.m

echo "Turning xml to sdp file"
docker run --platform linux/amd64 -v ~/Desktop/物理/sdpb/test4:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 pvm2sdp 1024  /usr/local/share/sdpb/new.xml /usr/local/share/sdpb/sdp.zip

echo "Running sdpb"
docker run --platform linux/amd64 -v ~/Desktop/物理/sdpb/test4:/usr/local/share/sdpb bootstrapcollaboration/sdpb:master mpirun --allow-run-as-root -n 4 sdpb --precision=1024 --procsPerNode=4 --checkpointInterval=500 --infeasibleCenteringParameter=0.01 --dualityGapThreshold=1e-15 --dualErrorThreshold=1e-20 --primalErrorThreshold=1e-20 -s /usr/local/share/sdpb/sdp.zip





