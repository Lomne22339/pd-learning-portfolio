#!/bin/bash
file="$1"
keywords="assign case endcase module endmodule parameter"
for word in $keywords
do
	count=$(grep -v "^[[:space:]]*//" "$file" | grep -wc "$word")
	echo "$word: $count"
done
echo ""
echo "Buahahaha its done."
