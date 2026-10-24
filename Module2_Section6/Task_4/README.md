# Task 4: NOR-Only Realization

## 1. Boolean Derivation

The given Boolean function is:

![Derivation](figures/nor_only_implementation.jpeg)

## 2. Circuit Diagram

![NOR-Only Circuit Diagram](figures/circuit_diagram.png)

## 3. Terminal Output

![NOR-Only Terminal Output](figures/terminal_output.png)

![Waveform Output](figures/task4_waveform.png)

## 4. Explanation

The function was implemented in two ways. The direct implementation uses the original Boolean expression, while the NOR-only implementation uses the NOR reduction operator (`~|`) to construct the equivalent logic.

A self-checking testbench tests all 16 possible combinations of inputs `a`, `b`, `c`, and `d`. Both implementations are checked against the expected output calculated from the original expression.

### Conclusion

Both implementations should produce the same output for all 16 input combinations. The testbench verifies the correctness of the NOR-only implementation by comparing its output with the direct implementation and the expected Boolean result.

## 5. Compile Workflow

The workflow is as follows:

```bash
iverilog -g2012 -s tb -o output_nor rtl/nor_only.sv tb/nor_realization_tb.sv
vvp output_nor
```