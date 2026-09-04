# Physical Design Learning Portfolio

Hands-on projects, scripts, and exercises documenting my journey toward becoming an entry-level Physical Design Engineer.

This repository covers the fundamental skills used throughout the VLSI and Physical Design flow, including Linux, Bash, TCL, Verilog, synthesis, timing analysis, and hands-on use of Synopsys EDA tools.

## Skills & Tools

**Programming & Scripting:** Linux, Bash, TCL, Verilog

**EDA Tools:** Synopsys VCS, Design Compiler, ICC2, PrimeTime

**Technology Environment:** Hands-on learning with a 65nm standard-cell library/PDK environment.

---

## Projects

### [FSM Verilog & Synthesis](./fsm_verilog_synthesis/)

Implementation of a 5-state Finite State Machine in Verilog using both binary and Gray state encoding. Includes RTL designs, testbenches, synthesized gate-level netlists, and a comparison of the resulting implementations.

**Focus:** Verilog RTL, FSM design, state encoding, simulation, and synthesis.

---

### [PrimeTime Real Library Query](./primetime_real_library_query/)

Queries standard-cell data from a 65nm technology library using Synopsys PrimeTime TCL commands and collection-based queries.

The project explores **866 cells**, including **209 flip-flops** and **145 scan flip-flops**, using commands such as `get_lib_cells` and Synopsys collections.

**Focus:** PrimeTime, TCL, standard-cell libraries, and EDA tool queries.

---

### [Verilog Keyword Counter](./verilog_keyword_counter/)

Two individually graded university exercises:

* A Bash script that counts Verilog keywords while excluding comments and partial-word matches.
* A TCL script that generates composite numbers.

**Focus:** Bash, TCL, text processing, regular expressions, and scripting logic.

---

### [TCL Scripting](./tcl_scripting/)

Exercises covering the core fundamentals of TCL scripting, including variables, lists, dictionaries, procedures, file I/O, strings, and regular expressions.

TCL is widely used for automation and controlling ASIC and Physical Design tools.

**Focus:** TCL programming and EDA automation fundamentals.

---

### [Bash Scripting Automation](./bash_scripting_automation/)

A Bash automation workflow that simulates timing-report triage by organizing files into a consistent naming convention and generating a structured summary.

This project uses synthetic practice data. See the project README for implementation details.

**Focus:** Linux, Bash scripting, file handling, and automation.

---

### [Bash & TCL Scripting](Bash_TCL_scripting)

A university coursework assignment implementing the same text-file analysis task using both TCL and Bash.

The scripts accept a text file as a command-line argument and determine:

- Total number of lines
- Total number of words
- Character count excluding spaces and line breaks
- Longest word
- Shortest word

The TCL implementation uses native TCL commands and logic without calling external UNIX commands, while the Bash implementation uses standard Linux command-line utilities for text processing.

**Focus:** Linux/UNIX, Bash, TCL, command-line arguments, file I/O, text processing, and scripting fundamentals.

---

## About

This repository is part of my self-directed preparation for entry-level Physical Design roles, alongside my university coursework in VLSI Design Flow and Memory Design and Testing.

The portfolio is continuously evolving as I progress through the Physical Design flow. Upcoming work will include more hands-on projects involving synthesis, floorplanning, placement, clock tree synthesis, routing, static timing analysis, timing closure, and other stages of the RTL-to-GDSII flow.

**More projects and technical work will be added as I continue learning and building.**
