proc is_composite {n} {
    if {$n < 4} {
        return 0
    }
    for {set i 2} {$i < $n} {incr i} {
        if {[expr {$n % $i}] == 0} {
            return 1
        }
    }
    return 0
}
for {set n 1} {$n <= 100} {incr n} {
    if {[is_composite $n]} {
        puts $n
    }
}

puts ""
puts "Name: Noorain"
puts "Roll Number: 2022339"
