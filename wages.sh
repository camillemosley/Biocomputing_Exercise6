#shell script to complete three tasks with the wages.csv file
#usage to run script: bash wages.sh wages.csv

# 1) isolate gender and years experience and move to a new file with gender in the first column, yearsExperience in the second column, and a space in between

cut -d , -f 1,2 "$1" | tr ',' ' ' | sort -k 1,1 -k 2,2n > gender_yearsExperience.csv

# 2) sort data by wage and determime female with the lowest wage, the male with the highest wage, and the number of females in the top 10 earners
# sort data by wage from least to greatest and save it to a file

tail -n +2 "$1" | sort -t ',' -k4,4n > sortedwage_data.csv

# a) find the lowest earner along with their gender and yearsExperience

lowest=$(head -n 1 sortedwage_data.csv)
echo "Lowest Earner:"
echo "$lowest"

# b) find the highest earner along with their gender and yearsExperience

highest=$(tail -n 1 sortedwage_data.csv)
echo "Highest Earner:"
echo "$highest"

# c) count number of females in the top ten earners

femalecountintopten=$(tail -10 sortedwage_data.csv | grep -c "female,")
echo "Number of Females in Top Ten Earners: $femalecountintopten"

rm sortedwage_data.csv

# 3) extract the lowest wage earned by a high school graduate and the lowest wage earned by a college graduate and find the difference between the two

# pull out the lowest wage for high school graduates with 12 years of education

highschoolwage=$(grep '^[^,]*,[^,]*,12,[^,]*$' wages.csv | cut -d ',' -f 4 | sort -n | head -n 1)

# pull out the lowest wage for college graduates with 16 years of education

collegewage=$(grep '^[^,]*,[^,]*,16,[^,]*$' wages.csv | cut -d ',' -f 4 | sort -n | head -n 1)

# calculate difference between lowest college and high school wage

echo "High School Wage: $highschoolwage"
echo "College Wage: $collegewage"

difference=$(echo "$collegewage - $highschoolwage" | bc)

# return difference to stdout
echo "The difference between lowest high school wage and lowest college wage is: $difference"
