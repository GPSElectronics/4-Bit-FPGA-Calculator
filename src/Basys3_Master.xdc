## Clock signal (100 MHz on the Basys 3)
set_property PACKAGE_PIN W5 [get_ports clk]							
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## LED 1
set_property PACKAGE_PIN V13 [get_ports led_0]
set_property IOSTANDARD LVCMOS33 [get_ports led_0]

## LED 2
set_property PACKAGE_PIN V3 [get_ports led_1]
set_property IOSTANDARD LVCMOS33 [get_ports led_1]

## Buttons
set_property PACKAGE_PIN U18 [get_ports btn]						
set_property IOSTANDARD LVCMOS33 [get_ports btn]

set_property PACKAGE_PIN V17 [get_ports {a_in[0]}]						
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[0]}]

set_property PACKAGE_PIN V16 [get_ports {a_in[1]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[1]}]  

set_property PACKAGE_PIN W16 [get_ports {a_in[2]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[2]}]

set_property PACKAGE_PIN W17 [get_ports {a_in[3]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {a_in[3]}]

set_property PACKAGE_PIN W15 [get_ports {b_in[0]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[0]}]

set_property PACKAGE_PIN V15 [get_ports {b_in[1]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[1]}]

set_property PACKAGE_PIN W14 [get_ports {b_in[2]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[2]}]

set_property PACKAGE_PIN W13 [get_ports {b_in[3]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {b_in[3]}]

set_property PACKAGE_PIN V2 [get_ports {operation[0]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {operation[0]}]

set_property PACKAGE_PIN T3 [get_ports {operation[1]}]                        
set_property IOSTANDARD LVCMOS33 [get_ports {operation[1]}]

## 7-Segment Display Segments (Cathodes)
# segment A
set_property PACKAGE_PIN W7 [get_ports {segments[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]
# segment B
set_property PACKAGE_PIN W6 [get_ports {segments[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
# segment C
set_property PACKAGE_PIN U8 [get_ports {segments[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
# segment D
set_property PACKAGE_PIN V8 [get_ports {segments[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
# segment E
set_property PACKAGE_PIN U5 [get_ports {segments[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
# segment F
set_property PACKAGE_PIN V5 [get_ports {segments[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
# segment G
set_property PACKAGE_PIN U7 [get_ports {segments[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]

## 7-Segment Display Anodes (Digit Selectors)
set_property PACKAGE_PIN U2 [get_ports {anodes[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[0]}]
set_property PACKAGE_PIN U4 [get_ports {anodes[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[1]}]
set_property PACKAGE_PIN V4 [get_ports {anodes[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[2]}]
set_property PACKAGE_PIN W4 [get_ports {anodes[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[3]}]