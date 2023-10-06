

cat wages.csv | tail -n +2 | cut -d , -f 1,2 | sed 's/,/ /' | sort -u -t ' ' -k 1,1 -k 2n > UniqueWages.txt

highest_earner=$(cat wages.csv | tail -n +2 | cut -d , -f 1,2,4 | sort -t , -k 3,3 -n | tail -n 1)

lowest_earner=$(cat wages.csv | tail -n +2 | cut -d , -f 1,2,4 | sort -t , -k 3,3 -n | head -n 1)

females_top10=$(cat wages.csv | tail -n +2 | cut -d , -f 1,2,4 | sort -t , -k 3,3 -n | tail -n 10 | grep -c -E "female")

min_12=$(cat wages.csv | tail -n +2 | cut -d , -f 3,4 | grep -E "12," | sort -t , -k 2,2 -n | head -n 1 | cut -d , -f 2)
min_16=$(cat wages.csv | tail -n +2 | cut -d , -f 3,4 | grep -E "16," | sort -t , -k 2,2 -n | head -n 1 | cut -d , -f 2)

diff=$(echo "$min_16 - $min_12" | bc)

echo "1) Highest earner: $highest_earner"
echo "2) Lowest earner: $lowest_earner"
echo "3) Number of top 10 earning females: $females_top10"
echo "4) The effect of graduating college (12 vs. 16 years of school) on minimum wage : $diff"
