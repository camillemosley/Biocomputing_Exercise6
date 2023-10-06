highest_earner=$(sort -t$'\t' -k4 -nr wages.csv | head -n 1 | awk -F'\t' '{print $1, $2, $4}')

lowest_earner=$(sort -t$'\t' -k4 -n wages.csv | head -n 1 | awk -F'\t' '{print $1, $2, $4}')

num_females_in_top_ten=$(sort -t$'\t' -k4 -nr wages.csv | head -n 10 | awk -F'\t' '$1 == "female" {count++} END {print count+0}')

min_wage_12=$(awk -F'\t' '$3 == 12 {print $4}' wages.csv | sort -n | head -n 1)
min_wage_16=$(awk -F'\t' '$3 == 16 {print $4}' wages.csv | sort -n | head -n 1)

if [[ -n $min_wage_12 && -n $min_wage_16 ]]; then
    difference=$(echo "$min_wage_16 - $min_wage_12" | bc -l)
else
    difference="N/A (Missing data)"
fi

echo "1) The highest earner: $highest_earner"
echo "2) The lowest earner: $lowest_earner"
echo "3) Number of females in the top ten earners: $num_females_in_top_ten"
echo "4) Effect of graduating college on the minimum wage (16 years vs 12 years): $difference"


