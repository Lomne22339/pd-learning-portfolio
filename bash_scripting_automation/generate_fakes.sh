#!/bin/bash
for i in $(seq 1 100)
do
    slack=$(( (RANDOM % 200) - 100 ))
    echo "Design: block_$i" > "temp_report_$i.txt"
    echo "Slack: ${slack} ps" >> "temp_report_$i.txt"
    if [ $slack -lt 0 ]
    then
        echo "STATUS: VIOLATION" >> "temp_report_$i.txt"
    else
        echo "STATUS: MET" >> "temp_report_$i.txt"
    fi
done
echo "Generated 100 fake reports."
