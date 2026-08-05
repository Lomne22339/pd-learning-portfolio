# Bash Automation - Report Renaming and Summary Table

## What This Does
A pipeline of Bash scripts that simulates a common PD triage task: given many
STA-style report files with inconsistent names, rename them into a clean
convention, then extract key fields (block name, slack, status) into one
summary table - without opening any file by hand.

## IMPORTANT - Data Honesty Note
The input report files used here are SYNTHETICALLY GENERATED (via
generate_fakes.sh, using bash's RANDOM) for practice purposes. This project
demonstrates real automation/scripting skill, but the underlying data is not
from an actual EDA tool run. See the primetime_real_library_query project in
this repo for a version built on real PrimeTime output.

## Files
generate_fakes.sh - creates 100 fake report files with random slack values
rename_reports.sh - renames temp_report_N.txt files into STA_blockNNN_final.rpt
summarize.sh - parses all renamed reports into one aligned summary.txt table
check_log.sh - checks a single file for the word "error"
check_all_logs.sh - loops check_log.sh's logic over every .log file in a folder

## How to Run
./generate_fakes.sh
./rename_reports.sh
./summarize.sh
cat summary.txt

## Sample Real Output (from an actual run)
Block           Slack(ps)   Status
block_1         -32         VIOLATION
block_2         6           MET
(51 of 100 simulated blocks showed a timing violation in one real run)

## Challenges and Debugging

1. cp without -r fails silently on folders, and if the destination name does
   not exist, cp creates a new FILE with that name instead of erroring
   clearly. This caused a confusing "Not a directory" error two steps later,
   traced back to a wrong destination path used while standing in the wrong
   folder.

2. A rename_reports.sh run using grep -o and printf %03d correctly padded
   file numbers (temp_report_7.txt to STA_block007_final.rpt) so that files
   sort in true numeric order rather than alphabetical order.

3. An early version of a file-existence check (check_errors) silently
   reported a missing file as "clean" because grep's exit status does not
   distinguish between "no match found" and "file does not exist." Identified
   the fix (an explicit -f file-existence test before grep) but left applying
   it as a follow-up exercise.

## Skills Demonstrated
Bash loops, functions, wildcards, grep/awk/printf, command substitution,
redirection (> and >>), regex basics for filename parsing.
