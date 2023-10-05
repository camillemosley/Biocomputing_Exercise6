# Task 1
awk -F, '!seen[$1$2]++ {print $1, $2}' wages.csv | sort -k1,1 -k2n > gender_years_experience.txt

# Task 2
highest_earner=$(tail -n +2 wages.csv | sort -t, -k4,4nr | head -n 1)
lowest_earner=$(tail -n +2 wages.csv | sort -t, -k4,4n | head -n 1)
num_females_top_ten=$(tail -n +2 wages.csv | sort -t, -k4,4nr | head -n 10 | grep -c ',female')

echo "$highest_earner" > highest_earner.txt
echo "$lowest_earner" > lowest_earner.txt
echo "$num_females_top_ten" > num_females_top_ten.txt

# Task 3
min_wage_12_years=$(grep ",12," wages.csv | cut -d ',' -f 4 | sort -n | head -n 1)
min_wage_16_years=$(grep ",16," wages.csv | cut -d ',' -f 4 | sort -n | head -n 1)

difference=$(echo "$min_wage_16_years - $min_wage_12_years" | bc)

echo "$difference" > effect_of_graduating_college.txt
