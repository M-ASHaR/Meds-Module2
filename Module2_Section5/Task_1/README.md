## 1. Schematic Diagram

![Gate Schematic](figures/task_5_1_schematic.png)

## 2. Terminal Output Screenshot

![Simulation Output](figures/task_5_1_terminal_output.png)

## 3. Waveform Screenshot

![EPWave Waveform](figures/task_5_1_waveform.png)

## 4. Explanation

The design implements AND, OR, and XOR gates using the same two inputs. The testbench applies all four possible input combinations and displays the outputs. The results are compared against the truth table to verify the behavior of each gate.

### 5. Compile Workflow:
The work flow is as follows:

```bash
iverilog -g2012 -o output rtl/hello_gate.sv tb/hello_gate_tb.sv
vvp output
gtkwave dump.vcd
```