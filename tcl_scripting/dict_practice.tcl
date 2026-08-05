set cell_slacks [dict create bufA 12 bufB -5 bufC 30 clkgate -20]
dict for {cell slack} $cell_slacks {
	if {$slack < 0} {
		puts "$cell -> VIOLATION (slack: $slack)"
	} else {
		puts "$cell -> MET (slack: $slack)"
	}
}
