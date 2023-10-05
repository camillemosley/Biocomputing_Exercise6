cat wages.csv | cut -d , -f 1,2 | sort -t, -k 1 -n >> gender.csv

