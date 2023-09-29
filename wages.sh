# usage: bash wages.sh

# Task 1
tail -n +2 wages.csv | cut -d, -f 1,2 | sort -t, -k1,1 -k2,2n | uniq | sed 's/,/ /g' > task1.txt

# Task 2
highest_earner=$(tail -n +2 wages.csv | sort -t, -k4 | tail -n 1)
lowest_earner=$(tail -n +2 wages.csv | sort -t, -k4 | head -n 1)
f_num_in_top_10=$(tail -n +2 wages.csv | sort -t, -k4 | tail -n 10 | grep -c '^female')

echo "The gender, yearsExperience, and wage for the highest earner is $(echo $highest_earner | cut -d, -f 1), $(echo $highest_earner | cut -d, -f 2), and $(echo $highest_earner | cut -d, -f 4)."
echo "The gender, yearsExperience, and wage for the lowest earner is $(echo $lowest_earner | cut -d, -f 1), $(echo $lowest_earner | cut -d, -f 2), and $(echo $lowest_earner | cut -d, -f 4)."
echo "The number of females in the top ten earners in this data set is $f_num_in_top_10."

# Task 3

min_wage_12=$(tail -n +2 wages.csv | cut -d, -f 3,4 | grep -E "^12," | cut -d, -f 2 | sort -n | head -n 1)
min_wage_16=$(tail -n +2 wages.csv | cut -d, -f 3,4 | grep -E "^16," | cut -d, -f 2 | sort -n | head -n 1)
effect=$(echo "$min_wage_16 - $min_wage_12" | bc)

echo "Minimum wage with 12 years of school: $min_wage_12."
echo "Minimum wage with 16 years of school: $min_wage_16."
echo "Effect of graduating college on minimum wage: $effect."