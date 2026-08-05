#!/bin/bash
for file in temp_report_*.txt
do
    number=$(echo "$file" | grep -o '[0-9]\+')
    padded=$(printf "%03d" "$number")
    new_name="STA_block${padded}_final.rpt"
    mv "$file" "$new_name"
done
echo "Renaming complete."
