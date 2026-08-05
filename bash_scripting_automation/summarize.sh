#!/bin/bash
echo "Block           Slack(ps)   Status" > summary.txt
echo "-----           ---------   ------" >> summary.txt

for file in STA_block*_final.rpt
do
    block=$(grep "Design:" "$file" | awk '{print $2}')
    slack=$(grep "Slack:" "$file" | awk '{print $2}')
    status=$(grep "STATUS:" "$file" | awk '{print $2}')
    printf "%-15s %-11s %s\n" "$block" "$slack" "$status" >> summary.txt
done

echo "Summary written to summary.txt"
