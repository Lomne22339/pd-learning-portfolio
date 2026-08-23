# 5-State Mealy FSM - One-Hot vs Gray Encoding Synthesis Comparison

## Assignment Objective (Real University Coursework - VDF Assignment 2)
Consider a given state machine with 5 states (S1-S5), one input, and a 2-bit
output, using one-hot encoding for the states. The assignment required:
(a) a Verilog model of the FSM, (b) a testbench, (c) simulation waveform and
correctness explanation, (d) a line coverage report, (e) synthesis using any
technology library with netlist analysis, and (f) rewriting the FSM using
gray encoding, re-synthesizing, and comparing/explaining the results.

## What This Project Actually Does
Builds a real 5-state Mealy FSM two ways - one-hot encoded and gray encoded -
simulates both with VCS, measures real line coverage, synthesizes both
through Synopsys Design Compiler against a real TSMC 65nm standard cell
library (CORE65LPHVT), and compares the real area/timing results.

## Files
fsm_5state.v - one-hot encoded FSM (5-bit state),

tb_fsm_5state.v - testbench, 9-step input sequence exercising most transitions,

fsm_5state_netlist.v - real synthesized gate-level netlist (one-hot version),

fsm_5state_gray.v - gray encoded FSM (3-bit state), behaviorally identical,

tb_fsm_5state_gray.v - matching testbench, same input sequence,

fsm_5state_gray_netlist.v - real synthesized gate-level netlist (gray version)

## How to Run
Simulation:
vcs fsm_5state.v tb_fsm_5state.v -o simv_fsm5

./simv_fsm5

Coverage:
vcs -cm line fsm_5state.v tb_fsm_5state.v -o simv_fsm5

./simv_fsm5 -cm line

urg -dir simv_fsm5.vdb

Synthesis (inside dc_shell):
set target_library "path/to/CORE65LPHVT_nom_1.00V_25C.db"

set link_library "* $target_library"

read_verilog fsm_5state.v

current_design fsm_5state

link

create_clock -name clk -period 10 [get_ports clk]

compile

report_area

report_timing


## Real Results

### Functional Verification
All 9 simulated steps for both encodings produced identical outputs,
confirming the two encodings are behaviorally equivalent. Outputs were
independently verified against a hand-derived state transition table before
being trusted.

### Line Coverage
100% line coverage achieved (verified via urg), confirming every executable
statement across all three FSM blocks (state register, next-state logic,
output logic) was exercised by the test sequence.

### One-Hot vs Gray - Real Synthesis Comparison

| Metric                  | One-Hot (5-bit) | Gray (3-bit) |
|--------------------------|-----------------|--------------|
| Total cells              | 36              | 22           |
| Sequential cells (FFs)   | 5               | 3            |
| Combinational cells      | 31              | 19           |
| Total cell area          | 140.92          | 78.52        |
| Worst-case data arrival  | 1.26 ns         | 0.76 ns      |
| Slack at 10ns clock      | 8.43 ns (MET)   | 9.00 ns (MET)|

Gray encoding won on every metric for this design: ~44% smaller area, fewer
flip-flops, and a faster critical path. This is a real, data-backed
finding worth noting explicitly: it does NOT confirm the common generalization
that one-hot is always faster. One-hot's speed advantage comes from simple,
single-bit decode logic, which matters most in FSMs with many states. For a
small, 5-state FSM like this one, the cost of 5 physical flip-flops (versus
3) and wider case logic outweighed any decode-simplicity benefit.

## Challenges and Debugging

1. Timing/lag investigation: initial hand-traced predictions for a smaller
   practice FSM consistently appeared "one step ahead" of the actual VCS
   output. Root cause, found by building a full clock-edge timeline: reset
   was released at a point in simulation time that did not align with the
   testbench's clock period, allowing one full clock edge to occur silently
   before the first checkpoint. Resolved by tracing every clock edge against
   every testbench event on a shared timeline.

2. Unexpected flip-flop cell split: Design Compiler's synthesis log initially
   showed the one-hot state register split into a "4-bit" and a "1-bit"
   group rather than one clean 5-bit register. Investigated using
   report_register and report_cell: state_reg[0] was mapped to a Set-type
   flip-flop (HS65_LH_DFPSQX4) while state_reg[1-4] were mapped to
   Reset-type flip-flops (HS65_LH_DFPRQX4). Root cause: the FSM's reset value
   (S1 = 5'b00001) requires bit 0 to be forced to 1 on reset while every
   other bit is forced to 0 - two genuinely different reset behaviors that
   Design Compiler correctly mapped to two different real flip-flop
   primitives from the library. (First hypothesis - that DC combinationally
   derived one bit to save a flip-flop - was tested directly against the
   real cell report and disproven; all 5 bits are real, separate flip-flops.)

3. DVE waveform viewer GUI failed to render its contents over the remote VNC
   session (blank window, no error, tool launched successfully and loaded
   the .vpd file with no file-format errors). This is a known limitation of
   this X11-based GUI tool class in a remote-desktop environment, not a
   simulation or data issue. Correctness was instead verified through
   console output ($display), cross-checked line-by-line against a
   hand-derived state transition table built directly from the assignment's
   state diagram.

4. Coverage database initially reported "No test found" by urg even though
   compilation succeeded. Root cause: the -cm line flag must be passed to
   BOTH the compile step and the runtime simulation step (./simv -cm line);
   passing it only at compile time creates the coverage-tracking structure
   but never actually records results into it.

## Skills Demonstrated
Mealy FSM design (state register / next-state logic / output logic
separation), one-hot and gray state encoding, VCS simulation and coverage
workflows, Design Compiler synthesis against a real 65nm PDK, reading and
interpreting real STA timing reports (arrival time, required time, slack),
investigating real synthesis-level flip-flop primitive selection, and
systematic tool/environment debugging (timing analysis, GUI rendering
limitations, coverage flag requirements).
