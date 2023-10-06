
#Code for part 2

echo "Highest Earner:"
cat wages.csv|sort -t ',' -k4,4nr|uniq|head -1

echo -e "\nLowest Earner:"
cat wages.csv|sort -t ',' -k4,4nr|uniq|tail -2|head -1

echo -e "\nNumber of females in top 10 earners:"
cat wages.csv|sort -t ',' -k4,4nr|uniq|head -10|grep -c 'female'

#part 3 code
echo -e "\nDifference between the lowest wage earned by a highschool graduate (12 years education) and the lowest wage earned by a college graduate (16 years education):"

collegewage=$(cat wages.csv|sed -n '/^[^,]*,[^,]*,16,/p'|sort -t ',' -k4nr|tail -1|cut -d ',' -f4)
hswage=$(cat wages.csv|sed -n '/^[^,]*,[^,]*,12,/p'|sort -t ',' -k4nr|tail -1|cut -d ',' -f4)

echo "$collegewage-$hswage"|bc

#Code for part 1
cat wages.csv|cut -d ',' -f 1,2|sort -t ',' -k1,1 -k2,2nr|uniq|tr ',' ' ' > wagesedited.txt

