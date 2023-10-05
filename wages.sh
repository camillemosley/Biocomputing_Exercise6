echo "Question 1:"
cat wages.csv | cut -d',' -f1,2 | sort -u -t',' -k1,1 -k2,2n | sed 's/,/ /g'
echo -en '\n'
echo "Question 2:"
echo "the lowest wage earner:"
cat wages.csv | sort -t',' -nk4 |head -n 2 | grep -E -w "[a-z]{0,2}male"
echo "the highest wage earner:"
cat wages.csv | sort -t',' -nrk4 |head -n 1
echo "the number of females in the top 10 wage earners:"
cat wages.csv | sort -t',' -nrk4 |head -n 10 | grep -c female
echo -en '\n'
echo "Question 3:"
var12=$(cat wages.csv | sort -t',' -nk4 | grep -E -m1 '12,[0-9]+\.' | cut -d, -f 4)
var16=$(cat wages.csv | sort -t',' -nk4 | grep -E -m1 '16,[0-9]+\.' | cut -d, -f 4)
echo "$var16 -$var12" | bc

