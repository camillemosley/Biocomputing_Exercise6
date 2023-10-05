# usage: bash gender-yearsex.sh

cat wages.csv | cut -d , -f 1,2 | sort -t, -k2,2n | sed 's/,/ /g' | grep 'female' > Gender-YearsEx.txt
cat wages.csv | cut -d , -f 1,2 | sort -t, -k2,2n | sed 's/,/ /g' | grep -w 'male' >> Gender-YearsEx.txt

echo "Highest Earner:"
cat wages.csv | sort -t, -k4,4nr | cut -d , -f 1,2,4 | head -1

echo "Lowest Earner:"
cat wages.csv | sort -t, -k4,4nr | cut -d , -f 1,2,4 | tail -2 | head -1

echo "Number of Females in the Top 10 Earners:"
cat wages.csv | sort -t, -k4,4nr | cut -d , -f 1,2,4 | head -10 | grep 'female' | wc -l

echo "Difference in Minimum Wage for 12 vs 16 Years of Schooling:"
min_16=$(cat wages.csv | sort -t, -k4,4nr | cut -d , -f 3,4 | grep 16, | cut -d , -f 2 | tail -1)
min_12=$(cat wages.csv | sort -t, -k4,4nr | cut -d , -f 3,4 | grep 12, | cut -d , -f 2 | tail -1)
echo "$min_16 - $min_12" | bc
