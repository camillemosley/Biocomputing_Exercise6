# Problem 1

tail -n+2 wages.csv | cut -f1,2 -d, | sort -t, -k1,1 -k2,2n | uniq | sed 's/,/ /g' > problem1.txt

# Problem 2

highest_earner=$(tail -n+2 wages.csv | sort -t, -k4n | tail -1)
lowest_earner=$(tail -n+2 wages.csv | sort -t, -k4nr | tail -1)
female_top10=$(tail -n+2 wages.csv | sort -t, -k4nr | head -10 | grep -c "female")

echo "Gender, yearsExperience, and wage for the highest earner are $(echo $highest_earner | cut -f1 -d,), $(echo $highest_earner | cut -f2 -d,), $(echo $highest_earner | cut -f4 -d,)"
echo "Gender, yearsExperience, and wage for the lowest earner are $(echo $highest_earner | cut -f1 -d,), $(echo $highest_earner | cut -f2 -d,), $(echo $highest_earner | cut -f4 -d,)"
echo "The number of females in the top ten earners in this data set is $female_top10"


# Problem 3

min_wage_12_years=$(tail -n +2 wages.csv | cut -f3,4 -d, | grep -E "^12," | cut -f2 -d, | sort -n | head -1)
min_wage_16_years=$(tail -n +2 wages.csv | cut -f3,4 -d, | grep -E "^16," | cut -f2 -d, | sort -n | head -1)
echo "The difference in minimum wages at 16 vs 12 years of school is $(echo "$min_wage_16_years - $min_wage_12_years" | bc)."