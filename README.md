# Physical Design Learning Portfolio

Scripts and exercises built while learning the fundamentals required for an
entry-level Physical Design (PD) Engineer role: Linux, Bash, and TCL
scripting, and hands-on use of real Synopsys EDA tools (VCS, Design Compiler,
ICC2, PrimeTime) with a real TSMC 65nm PDK.

## Projects

### primetime_real_library_query
Queries real standard cell data (866 cells, 209 flip-flops, 145 scan
flip-flops) from an actual 65nm PDK library using Synopsys PrimeTime TCL
commands (get_lib_cells, collections).

### verilog_keyword_counter
Two real, individually-graded university exercises: a Bash script that
correctly counts Verilog keywords while excluding comments and partial-word
matches, and a TCL script generating composite numbers.

### tcl_scripting
Core TCL fundamentals - variables, lists, dictionaries, procs, file I/O, and
string/regex handling - the scripting language used to control real PD tools.

### bash_scripting_automation
A Bash automation pipeline simulating STA report triage: renaming files into
a clean convention and building a summary table. Uses synthetic practice
data - see that folder's README for details.

## About
Built as part of self-directed preparation for entry-level Physical Design
roles in Europe, alongside university coursework in VLSI Design Flow and
Memory Design and Testing.
