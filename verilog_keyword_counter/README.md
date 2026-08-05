# Verilog Keyword Counter and TCL Composite Numbers

## What This Does
Two real, individually-assigned university exercises (VDF Assignment 1):
a Bash script that counts occurrences of specific Verilog keywords in a
source file while correctly excluding comments and partial-word matches,
and a TCL script that prints all composite numbers from 1 to 100.

## Files
count_keywords.sh - counts assign, case, endcase, module, endmodule, and
parameter in a Verilog file, skipping full comment lines and rejecting
partial-word matches (e.g. "modular" does not count as "module")
composite.tcl - identifies and prints every composite number between 1 and
100 using a nested loop and the modulo operator
test_design.v - a hand-built Verilog test file with deliberate edge cases
(indented comments, trailing comments, and lookalike words such as
my_module_wire and modular_test) used to verify count_keywords.sh by hand
before trusting its output

## How to Run
./count_keywords.sh test_design.v
tclsh composite.tcl

## Sample Real Output
assign: 1
case: 1
endcase: 1
module: 2
endmodule: 2
parameter: 2

## Challenges and Debugging

1. grep alone matches partial words (e.g. a plain search for "module" would
   incorrectly match "modular"). Fixed using grep -w for whole-word matching,
   which treats letters, digits, and underscores as one connected word.

2. Excluding comment lines required a specific regex:
   grep -v "^[[:space:]]*//" - the ^ anchors to the start of the line, and
   [[:space:]]* allows for indented comments, not just ones starting at
   column 1. Verified this correctly excluded an indented comment line
   containing the word "parameter" that should not have been counted.

3. Before trusting the script's output, manually hand-counted every keyword
   in the test file line by line (correctly excluding all 3 comment lines)
   to build an independent answer key, then confirmed the script's actual
   output matched it exactly.

## Skills Demonstrated
grep -w (whole-word matching), grep -v with anchored regex (comment
exclusion), TCL nested loops, the modulo operator, manual verification
against a hand-derived answer key before trusting automation.
