# This script analyzes a text file provided as a command-line argument

if {$argc != 1} {
    puts "Usage: tclsh code.tcl <filename>"
    exit
}

# Get the filename from the command-line argument
set filename [lindex $argv 0]

# Check whether the specified file exists
if {![file exists $filename]} {
    puts "Error: File '$filename' not found."
    exit
}

# Open the file for reading
set fileHandle [open $filename r]

# Read the complete contents of the file
set content [read $fileHandle]

# Close the file after reading
close $fileHandle

# Count the number of lines in the file
set lineCount [llength [split $content "\n"]]

# If the file ends with a newline, split creates an extra empty element
if {[string length $content] > 0 && [string index $content end] eq "\n"} {
    incr lineCount -1
}

# Count the total number of words
set words [regexp -all -inline {\S+} $content]
set wordCount [llength $words]

# Count characters excluding spaces and new line characters
set noSpaces [string map {" " "" "\n" "" "\r" ""} $content]
set charCount [string length $noSpaces]

# Find the longest and shortest words
set longestWord ""
set shortestWord ""

foreach word $words {
    set wordLength [string length $word]

    if {$longestWord eq "" || $wordLength > [string length $longestWord]} {
        set longestWord $word
    }

    if {$shortestWord eq "" || $wordLength < [string length $shortestWord]} {
        set shortestWord $word
    }
}

# Display the results
puts "Total Words: $wordCount"
puts "Total Lines: $lineCount"
puts "Total Characters (excluding spaces): $charCount"
puts ""
puts "Longest Word: $longestWord"
puts "Shortest Word: $shortestWord"
puts ""
puts "Prepared by: Noorain"
puts "Roll Number: 2022339"
