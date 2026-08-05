set filehandle [open "tempus.log" r]
set errorcount 0
while {[gets $filehandle line] >= 0} {
	if {[string match "*ERROR*" $line]} {
		puts "found : $line"
		set errorcount [expr {$errorcount + 1}]
	}
}
close $filehandle
puts "total errors found : $errorcount"
