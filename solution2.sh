highest_earner=$(sort -t$'\t' -k4 -nr wages.csv | head -n 1 | awk -F'\t' '{print $1, $2, $4}')

lowest_earner=$(sort -t$'\t' -k4 -n wages.csv | head -n 1 | awk -F'\t' '{print $1, $2, $4}')

num_females_in_top_ten=$(sort -t$'\t' -k4 -nr wages.csv | head -n 10 | awk -F'\t' '$1 == "female" {count++} END {print count+0}')

echo "1) The highest earner: $highest_earner"
echo "2) The lowest earner: $lowest_earner"
echo "3) Number of females in the top ten earners: $num_females_in_top_ten"

