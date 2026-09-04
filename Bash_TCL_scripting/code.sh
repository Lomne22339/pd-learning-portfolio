#!/bin/bash

# Assignment - Shell Script
# This script analyzes a text file provided as a command-line argument

# Check whether exactly one filename was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: bash code.sh <filename>"
    exit 1
fi

# Store the filename
filename="$1"

# Check whether the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

#Count the number of lines
lineCount=$(wc -l < "$filename")

# Count the number of words
wordCount=$(wc -w < "$filename")

# Count characters excluding spaces and newline characters
charCount=$(tr -d ' \n\r' < "$filename" | wc -c)

# Find the longest and shortest words
longestWord=$(awk '
{
    for (i = 1; i <= NF; i++) {
        if (length($i) > max) {
            max = length($i)
            longest = $i
        }
    }
}
END {
    print longest
}' "$filename")

shortestWord=$(awk '
{
    for (i = 1; i <= NF; i++) {
        if (min == "" || length($i) < min) {
            min = length($i)
            shortest = $i
        }
    }
}
END {
    print shortest
}' "$filename")

# Display the results
echo "File Name: $filename"
echo "Total Lines: $lineCount"
echo "Total Words: $wordCount"
echo "Total Characters (excluding spaces): $charCount"
echo ""
echo "Longest Word: $longestWord"
echo "Shortest Word: $shortestWord"
echo ""
echo "Prepared by: Noorain"
echo "Roll Number: 2022339"

