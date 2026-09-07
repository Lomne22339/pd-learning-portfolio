# Static Timing Analysis - Real PrimeTime/Design Compiler Experiments

## Assignment Objective (Real University Coursework - VDF Assignment 3)
Gain hands-on experience with Timing Analysis. Given a circuit (a 3-flip-flop
design with combinational logic between stages), write a Verilog netlist and
an SDC file constraining all flip-flops and output ports, run STA, and report
the worst setup and hold slack. Then, independently on top of that baseline,
run five further experiments: adding clock latency and uncertainty; doubling
clock frequency; tightening input delay; tightening output delay; and adding
paired setup/hold multicycle path exceptions - explaining the timing impact
of each.

## What This Project Actually Does
Builds the given circuit as a real structural Verilog netlist, synthesizes it
against a real TSMC 65nm standard cell library (CORE65LPHVT) using Synopsys
Design Compiler, and runs six independent, isolated STA experiments using
real PrimeTime-style timing reports - each with its own dedicated SDC file
for full reproducibility.

## Files
top.v - structural Verilog netlist (DFF module + top module, matching the
given schematic exactly)
baseline_q3.sdc - Question 3 baseline: clock period 10, input/output delays
exp4_latency_uncertainty.sdc - adds clock latency (1) and uncertainty (0.5)
exp5_double_freq.sdc - clock period halved to 5 (double frequency)
exp6_input_delay.sdc - input delay on port a tightened from 2 to 5
exp7_output_delay.sdc - output delay tightened from 3 to 6
exp8_multicycle.sdc - paired setup (x4) and hold (x3) multicycle exceptions
Results/ - real PrimeTime/DC screenshots for every experiment

## How to Run
dc_shell
set target_library "path/to/CORE65LPHVT_nom_1.00V_25C.db"
set link_library "* $target_library"
read_verilog top.v
current_design top
link
compile
read_sdc <any .sdc file above>
report_timing -delay_type max
report_timing -delay_type min

## Real Results (All Independently Verified, Each Isolated From Every Other)

| Experiment                        | Worst Setup Slack | Worst Hold Slack        |
|------------------------------------|--------------------|--------------------------|
| Q3 Baseline                        | 6.71 ns (MET)      | 0.34 ns (MET)            |
| Exp 4 - Latency + Uncertainty      | 6.21 ns (MET)      | -0.16 ns (VIOLATED)      |
| Exp 5 - Doubled Frequency          | 2.79 ns (MET)      | 0.34 ns (MET, unchanged) |
| Exp 6 - Tightened Input Delay      | 4.79 ns (MET)      | 5.06 ns (MET)            |
| Exp 7 - Tightened Output Delay     | 3.71 ns (MET)      | 0.34 ns (MET, unchanged) |
| Exp 8a - Setup-only Multicycle x4  | 36.71 ns (MET)     | -26.73 ns (phantom viol.)|
| Exp 8b - + Hold Multicycle x3      | 36.71 ns (unchanged)| 0.34 ns (MET, resolved) |

## Key Findings

1. Clock latency, when applied identically to launch and capture flops
   sharing one clock path, cancels out in the slack calculation entirely -
   it is a real physical delay affecting both sides of the comparison
   equally. Clock uncertainty does NOT cancel: it represents unpredictability
   rather than a real physical delay, and is deliberately applied as a
   pessimistic margin in both directions - subtracted from setup's required
   time, added to hold's - genuinely worsening both checks independently.

2. Clock period changes affect setup proportionally but have zero measurable
   effect on hold, confirmed to the exact decimal (0.34ns unchanged after
   halving the period) - real, concrete proof that hold timing is entirely
   period-independent.

3. Tightening an input or output delay constraint directly and proportionally
   increases arrival time on paths touching that port, with zero change to
   the actual circuit - demonstrating that boundary timing assumptions are as
   consequential to signoff as the real gates themselves.

4. A setup-only multicycle exception, applied without a paired hold
   exception, produces a large phantom hold violation unrelated to any real
   design problem. The tool's default hold reference point shifts along with
   the setup multiplier, effectively pushing the hold check out to
   (multiplier - 1) clock cycles later than normal - a generic side effect
   of any unpaired setup-only multicycle exception. Adding the matching hold
   multicycle exception (Experiment 8b) resolves this, restoring the correct
   baseline hold result.

## Challenges and Debugging

1. Non-independent experiments (real methodology bug, caught and fixed):
   early experiments were run by editing one shared SDC file and reloading
   it repeatedly, silently stacking each experiment's changes on top of the
   last rather than testing them independently as the assignment requires.
   Fixed by creating one dedicated, clean SDC file per experiment and
   re-verifying every result from a true, isolated baseline.

2. read_sdc does not clear previously-set attributes that a newly loaded
   file does not mention. Loading a new, "clean" SDC file after directly
   setting clock_latency/clock_uncertainty at the prompt left those old
   values silently active. Diagnosed using get_attribute checks and by
   comparing reported required-time math against hand-calculated
   expectations, and resolved using explicit remove_clock_latency /
   remove_clock_uncertainty calls before each new experiment.

3. A related, more specific version of the same bug: remove_clock_latency
   and remove_clock_uncertainty were first called on the wrong object type
   (get_ports clk instead of get_clocks clk) - the commands returned success
   but silently operated on the wrong object, leaving the actual clock
   attributes untouched. Caught by noticing a contaminated result did not
   match the expected clean baseline, and confirmed via get_attribute before
   trusting any further data.

4. set_clock_uncertainty intermittently failed to apply when loaded via
   read_sdc from a file, but worked reliably when typed directly at the
   prompt in the same session - a real, session-specific tool quirk, worked
   around by always verifying with get_attribute after every load and
   re-applying directly when necessary.

5. dc_shell does not automatically re-run technology mapping after a fresh
   read_verilog/link sequence in a new session; without an explicit compile
   step, report_timing silently operates on generic, unmapped GTECH/SEQGEN
   placeholder cells with zero real delay data. Caught by noticing cell
   names that did not match the real CORE65LPHVT library used elsewhere in
   the same project.

## Skills Demonstrated
Structural Verilog netlist construction from a schematic, real Design
Compiler synthesis and SDC-driven STA, precise setup/hold slack
interpretation, clock latency vs. uncertainty mechanics, period-independence
of hold timing, multicycle path exceptions and their side effects,
disciplined independent-experiment methodology, and systematic real-tool
debugging (object-type errors, session state persistence, and technology
mapping prerequisites).
