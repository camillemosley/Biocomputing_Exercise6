cat wages.csv | sort -k 1,1 -k 2,2 | cut -d , -f 1,2 >> genderYears.csv
