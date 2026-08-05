
proc check_cell {cell_name} {
	if {[string match "buf*" $cell_name]} {
		puts "$cell_name -> starts with buf"
	} else {
		puts "$cell_name -> does not start with buf"
	}
}
set cells {bufA bufB bufC clkgate invbig}
foreach cell $cells {
	check_cell $cell
}
