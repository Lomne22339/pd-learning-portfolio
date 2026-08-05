#!/bin/bash
if grep -qi "error" "$1"
then
    echo "problems found in $1 - che k the log!"
else 
    echo "$1 looks clean, no errors found."
fi
