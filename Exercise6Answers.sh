#Usage : bash filename
#Question 1 answer:

cat "$1" | cut -d, -f 1,2 | sed 's/,/ /g' 

#Question 2 answer:

#2a
echo gender,yearsExperience,wage of highest earner
cat "$1" | sort -t ',' -k 4,4n  | cut -d, -f 1,2,4 | tail -n 1

#2b
echo gender,yearsExperience,wage of lowest earner
cat "$1" | sort -t ',' -k 4,4n | head -n 2 | tail -n 1 | cut -d, -f 1,2,4   

#2c
echo Number of females in the top ten earners
cat "$1" | sort -t ',' -k 4,4n | tail -n 10 | grep -c female  

#Question 3 answer:

#count12="$(cat "$1" | sort -t ',' -k 3,3n | head -n 2542 | tail -n 1187 | wc -l)"

#echo yearsSchool,wage

#Average wage for 12 years of school
#	new file for wages of 12 years of school	
cat wages.csv| sort -t ',' -k 3,3n | cut -d, -f 4 | head -n 2542 | tail -n 1187 > wagesfor12.txt

#variables
sumoftotal12="$(paste -sd+ wagesfor12.txt | bc -l)"

total12="$(cat "$1" | sort -t ',' -k 3,3n | head -n 2542 | tail -n 1187 | wc -l)"
 
echo "Average wage for 12 years of school"
echo "($sumoftotal12)/$total12" | bc

#average wage for 16 years of school
#       new file for wages of 16 years of school
cat wages.csv| sort -t ',' -k 3,3n | cut -d, -f 4 | head -n 3295 | tail -n 15 > wagesFor16.txt

#variables
sumoftotal16="$(paste -sd+ wagesFor16.txt | bc -l)"

total16="$(cat "$1" | sort -t ',' -k 3,3n | head -n 3295 | tail -n 15 | wc -l)"

echo "Average wage for 16 years of school"
echo "($sumoftotal16)/$total16" | bc
