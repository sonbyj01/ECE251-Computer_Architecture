# Assignment 2
[Documentation](ECE251_Assignment2.pdf)

For this assignment, the goal was two fold: to program (1) combinatorial logic using two inputs and
having three outputs, and (2) a three-bit, up/down counter with synchronous clear, count enable,
and output enable using five inputs and having three ouputs, onto a 22V10 PLD chip. The program
was written using WinCupl: Atmel Version.

1. Combinatorial logic:
With two inputs (A and B), there would be three outputs (Y0..Y2), with the operations
’NOT’, ’AND’, and ’XOR’, respectively. In other words:

    • Y0 = NOT A

    • Y1 = A AND B

    • Y2 = A XOR B

2. Three-bit, Up/Down Counter:
With five inputs (clock, direction, enable, clear, output enable), there would be three outputs (Y3..Y5), where Y5 is the most significant bit and Y3 is the least significant bit. The
functionality for each input is as follows:

    • clock = counter output changes on the rising edge

    • direction = count increments if direction=1 and decrements if direction=0

    • enable = count if enable=1; hold current count if enable=0

    • clear = reset to zero on the next clock if clear=1 and counter is enabled
    
    • output enable = Y3-Y5 are active digital outputs if output enable=1 and Hi-Z if output enable=0