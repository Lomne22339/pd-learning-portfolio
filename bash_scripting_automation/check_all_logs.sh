#!/bin/bash
for file in ~/*.log
do 
	echo "CHecking: $file"
	grep -qi "error" "$file" && echo " -> Errors found!" || echo " -> clean"
done
