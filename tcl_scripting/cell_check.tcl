set cells {bufA bufB bufC clkgate}
foreach cell $cells {
	puts "checking cell : $cell" 
	if {[string match  "buf*" $cell]} {
		puts "starts with buf" 
	} else {
		puts " does not start with buf"
	}
}
