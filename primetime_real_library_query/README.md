# Real Standard Cell Library Query - Synopsys PrimeTime

## What This Does
A TCL script that connects to a real Synopsys PrimeTime session, loads an actual
65nm standard cell library from the cmos065_536 PDK, and queries real cell data:
total cell count, flip-flop count, and scan flip-flop count.

## Why
This simulates a genuine, common PD task: using tool-specific TCL commands
(get_lib_cells) to pull real data from a standard cell library, rather than
working with cell names typed by hand. The distinction between flip-flops and
scan flip-flops is directly relevant to Design-for-Test (DFT) flows.

## Tools Used
- Synopsys PrimeTime (R-2020.09-SP4)
- Real TSMC 65nm PDK (cmos065_536), CORE65LPHVT library

## How to Run
pt_shell

source query_library.tcl

## Sample Real Output
Total cells in library: 866

Flip-flop cells: 209

Scan flip-flop cells: 145

## Challenges and Debugging

1. Wrong library file initially chosen. First attempted to load
   SHIFT65_HS_LP_SW, a specialized dual-supply/level-shifter library, which
   produced an unmapped tool error (LCSH-3). Switched to a standard
   single-supply core logic library (CORE65LPHVT) instead, which loaded
   cleanly - a reminder that not all .lib files in a PDK serve the same purpose.

2. PT-063: Library Compiler executable path is not set. PrimeTime's read_lib
   internally depends on a separate tool, Library Compiler, and couldn't find
   it. Root cause: found and read PrimeTime's actual environment setup script
   and identified the correct required variable, SYNOPSYS_LC_ROOT - plus a
   first attempt that failed silently because the variable was set without
   export, so it never reached the pt_shell subprocess.

3. get_lib_cells does not return a plain TCL list. Calling llength on the
   result incorrectly returned 1. Root cause: PrimeTime's get_* commands
   return a collection, a different object type that looks list-like but
   requires its own commands - sizeof_collection and foreach_in_collection -
   instead of standard TCL list commands.

## Skills Demonstrated
Tool-specific TCL (get_lib_cells, collections), environment variable
debugging, reading and diagnosing real EDA tool error codes.
