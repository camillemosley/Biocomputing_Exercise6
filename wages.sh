echo "Answer to Question 1:"
cat wages.csv | cut -d',' -f1,2 | sort -u -t',' -k1,1 -k2,2n | sed 's/,/ /g'
## answer to question 1: the unique years of experience and genders

echo "Answer to Question 2:"
echo "Lowest wage earner:"

cat wages.csv | sort -t',' -nk4 |head -n 2 | grep -E -w "[a-z]{0,2}male"

echo "Highest wage earner:"

cat wages.csv | sort -t',' -nrk4 |head -n 1

echo "Number of females listed out of the top 10 wage earners:"
cat wages.csv | sort -t',' -nrk4 |head -n 10 | grep -c female
## this is the answer to question 2, labeled and sorted

echo "Answer to Question 3:"

var12=$(cat wages.csv | sort -t',' -nk4 | grep -E -m1 '12,[0-9]+\.' | cut -d, -f 4)

var16=$(cat wages.csv | sort -t',' -nk4 | grep -E -m1 '16,[0-9]+\.' | cut -d, -f 4)

echo "$var16 -$var12" | bc
## this is the answer to question 3: the lowest wage earned by someone with a high school degree subtracted from the lowest wage earner with a college degree.
 
