# Thunderbird Tail Light Controller (FSM)

A synchronous Finite State Machine (FSM) implementation of the classic sequential turn signals for a Ford Thunderbird. 

---


### State Sequence
The controller utilizes an **8-state FSM** driven by three state variables ($E_3, E_2, E_1$). 

* **Idle:** All lights OFF.
* **Left Turn:** (Idle) → $L_a$ → $L_a L_b$ → $L_a L_b L_c$ → (Idle).
* **Right Turn:** (Idle) → $R_a$ → $R_a R_b$ → $R_a R_b R_c$ → (Idle).
* **Hazard:** All lights flash ON/OFF in a single-cycle loop.


### Logisim Schematic
* Built using discrete logic gates (AND, OR, NOT).
* Utilized **D-type Flip-Flops** for state memory.
* Simulated various input combinations (L, R, H) to verify sequence timing against the clock signal.
<img width="1280" height="847" alt="image" src="https://github.com/user-attachments/assets/ef108a06-824d-414d-8637-6af26518847e" />

### Structural Verilog
The design was ported to Verilog using a structural (gate-level) approach to mirror the hardware schematic:
* **Module-based Design:** Separate modules for D-Flip-Flops and combinatorial logic.
* **Gate Primitives:** Logic implemented using `and`, `or`, and `not` primitives.
* **Verification:** Validated using a testbench and waveform analysis to confirm signal integrity and state
<img width="614" height="232" alt="image" src="https://github.com/user-attachments/assets/5e28b258-e320-4408-8764-5c253d14ddee" />


This project was created as a final project for TCES 230 (Logic Design) at the University of Washington Tacoma by Jaiden Stipp
