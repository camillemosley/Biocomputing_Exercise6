var12=$(cat wages.csv | sort -t',' -nk4 | grep -E -m1 '12,[0-9]+\.' | cut -d, -f 4) 

var16=$(cat wages.csv | sort -t',' -nk4 | grep -E -m1 '16,[0-9]+\.' | cut -d, -f 4)


echo "$var16 -$var12" | bc
