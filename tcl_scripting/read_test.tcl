set filehandle [open "tempus.log" r]
set contents [read $filehandle]
puts $contents
close $filehandle
