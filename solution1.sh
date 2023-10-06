awk -F'\t' '{print $1 " " $2}' wages.csv | sort | uniq > output.txt

