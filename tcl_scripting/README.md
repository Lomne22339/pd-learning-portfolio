# TCL Scripting Fundamentals

## What This Contains
A set of small TCL scripts built while learning core TCL: variables, lists,
dictionaries, procs, file I/O, and string/regex handling - the language used
to control real EDA tools like PrimeTime, ICC2, and Design Compiler.

## Files
cell_check.tcl - loops over a list of cell names, uses string match to check
a wildcard naming pattern (buf*)
check_cell.tcl - same check rebuilt as a reusable proc, called across a list
dict_practice.tcl - builds a dictionary of cell-to-slack pairs, loops over it
with dict for, flags negative slack as a violation
count_errors.tcl - opens a real log file, reads it line by line with gets,
counts ERROR occurrences using string match
read_test.tcl - demonstrates basic file I/O: open, read, puts, close

## How to Run
tclsh cell_check.tcl
tclsh dict_practice.tcl
tclsh count_errors.tcl

## Challenges and Debugging

1. Early scripts used single-line typing in the interactive tclsh shell,
   which auto-echoes every command's return value. This looked like a bug
   at first (commands appeared to "repeat themselves") until realizing tclsh
   is a REPL - the auto-print disappears entirely once code runs as a real
   .tcl script file instead.

2. Missing closing quotes in string match patterns (e.g. "buf* $cell instead
   of "buf*" $cell) caused a "missing quote" parse error partway through a
   multi-line command. Fixed by carefully balancing every opening and closing
   quote/brace.

3. Defined a proc but forgot to actually call it anywhere in the script -
   the script ran with zero output and no error, since defining a proc does
   not execute it. Fixed by adding explicit calls to the proc after its
   definition.

4. Typed a wrong subcommand name (string matches instead of string match) -
   TCL's error message listed every valid string subcommand, which was the
   fastest way to spot and fix the typo.

## Skills Demonstrated
TCL variables, lists, dictionaries, procs, foreach loops, file I/O (open,
gets, read, close), string match and regexp pattern matching.
