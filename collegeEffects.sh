cat wages.csv | cut -d , -f 3 | grep "12" >> highSchool.csv
cat wages.csv | cut -d , -f 3 | grep "16" >> college.csv

lowestHSearner=$(cat highSchool.csv | sort -k 4,4 | cut -d , -f 4 | tail -n 1) 
lowestcollegeearner=$(cat college.csv | sort -k 4,4 | cut -d , -f 4 | tail 
-n 1)

echo "$lowestcollegeearner - $lowestHSearner" | bc 
