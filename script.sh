# Script for performing 3 tasks with wages.csv:
## 1. Creating a file of unique gender and the corresponding years of experience
## 2. Returning 3 stdout options depending on argument (1, 2, or 3):
###### a. Gender, years of experience, and wage for the highest earner
###### b. Gender, years of experience, and wage for the lowest earner
###### c. Number of females in top 10 earners
## 3. Effect of graduating college on the minimum wage of earners

# Usage: bash script.sh #

### 1. Creating a file of unique gender and corresponding years of experience:
cat wages.csv | tail -n 3294 | cut -d, -f 1,2 | sort -t, -k1,1 -k2,2n -u | tr ',' ' ' > UniqueGenderYearsExp.txt

### 2. Returning the std options depending on the argument inputted
if [[ $1 == "1" ]]
then
	echo "Highest Earner:"
	cat wages.csv | tail -n 3294 | sort -t, -k4,4nr | head -n 1 | cut -d, -f 1,2,4 | awk -F',' '{print " Gender: "$1 "\n Years of Experience: "$2 "\n Wage: "$3}'
elif [[ $1 == "2" ]]
then
	echo "Lowest Earner:"
	cat wages.csv | tail -n 3294 | sort -t, -k4,4n | head -n 1 | cut -d, -f 1,2,4 | awk -F',' '{print " Gender: "$1 "\n Years of Experience: "$2 "\n Wage: "$3}'
elif [[ $1 == "3" ]]
then
	number=$(cat wages.csv | tail -n 3294 | sort -t, -k4,4n | head -n 10 | grep -c -o -w "female")
	echo "Number of Females in Top 10 Earners: $number"

else
	echo "Argument not valid. Enter 1, 2, or 3"
fi

### 3. Returning stdout of minimum wage between high school gradutes (12 years of experience) vs college graduates (16 yars of experience)
highschool_min=$(cat wages.csv | cut -d, -f 3,4 | grep -E "12\," | sort -t, -k2,2n | head -n 1 | cut -d, -f 2)
college_min=$(cat wages.csv | cut -d, -f 3,4 | grep -E "16\," | sort -t, -k2n | head -n 1 | cut -d, -f 2)

echo -e "\nHigh school minimum wage = $highschool_min\nCollege minimum wage = $college_min"
echo "The minimum wage difference between a high school graduate and a college graduate is:"; echo "$college_min - $highschool_min" | bc
