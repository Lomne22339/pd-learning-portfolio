# Query real standard cell library data from the cmos065_536 PDK using PRIMETIME

read_lib /usr/local/cmos065_536/CORE65LPHVT_5.1/libs/CORE65LPHVT_nom_1.00V_25C.lib

set all_cells [get_lib_cells */*]
puts "Total cells in library: [sizeof_collection $all_cells]"

set flops [get_lib_cells "*/*DFP*"]
puts "Flip-flop cells: [sizeof_collection $flops]"

set scan_flops [get_lib_cells "*/*SDFP*"]
puts "Scan flip-flop cells: [sizeof_collection $scan_flops]"

