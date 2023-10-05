cat wages.csv | cut -d, -f 1,2,4 | sort -t, -k 4 -n | head -n 1, tail -n 1 

cat wages.csv | sort -t, -k 4 -n | head -n 10 | wc -l 
