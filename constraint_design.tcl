#Read the design
read_file -format verilog "/gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/test.v"

#set the current design
set current_design script
 
#Link the design
link 
uniquify

create_clock -period 50 clk -waveform {0 25} -name clk
set_clock_latency 0.3 clk
set_input_delay 2.0 -clock clk [ all_inputs ]
set_output_delay 1.65 -clock clk [ all_outputs ]
set_load 0.1 [ all_outputs ]
set_max_fanout 4 [ all_inputs ]
set_fanout_load 10 [ all_outputs ]
set_clock_uncertainty 0.5 clk
set_dont_touch_network  "clk" 

set_max_area 0
set_wire_load_model -name "10x10" -library "lsi_10k"
set_clock_transition 0.2 clk
set_drive 0 [find port {clk  }]
set_wire_load_model -name "10x10" -library "lsi_10k"
compile -map_effort medium -boundary_optimization

report_timing > timing.report


report_timing -from a -to d1/din -delay_type max > /gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/reports/setupreport_path1.report
report_timing -from x -to d2/din -delay_type max > /gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/reports/setupreport_path2.report
report_timing -from d2/q -to op -delay_type max > /gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/reports/setupreport_path3.report
report_timing -from b -to op -delay_type max > /gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/reports/setupreport_path4.report
report_timing -from a -to d1/din -delay_type min > /gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/reports/holdreport_path1.report
report_timing -from x -to d2/din -delay_type min > /gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/reports/holdreport_path2.report
report_timing -from d2/q -to op -delay_type min > /gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/reports/holdreport_path3.report
report_timing -from b -to op -delay_type min > /gaia/class/ee2741/ee27414/eee274/project_2/part1/part_1_A/reports/holdreport_path4.report









