## Problem 1
cat wages.csv | sort -k 1,1 -k 2,2 | cut -d , -f 1,2 >> genderYears.csv

## Problem 2
cat wages.csv | sort -k 4,4 | cut -d , -f 1,2,4 >> wagesSortedByEarners.csv
head -n 1 wagesSortedByEarners.csv
tail -n 1 wagesSortedByEarners.csv

