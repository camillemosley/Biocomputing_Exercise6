#Usage : bash filename
#Question 1 answer:

cat "$1" | cut -d, -f 1,2 | sed 's/,/ /g' 

#Question 2 answer:

#2a
echo gender,yearsExperience,wage of highest earner
cat "$1" | sort -t ',' -k 4,4n  | cut -d, -f 1,2,4 | tail -n 1

#2b
echo gender,yearsExperience,wage of lowest earner
cat "$1" | sort -t ',' -k 4,4n | head -n 2 | tail -n 1 | cut -d, -f 1,2,4   

#2c
echo Number of females in the top ten earners
cat "$1" | sort -t ',' -k 4,4n | tail -n 10 | grep -c female  

#Question 3 answer:

#count12="$(cat "$1" | sort -t ',' -k 3,3n | head -n 2542 | tail -n 1187 | wc -l)"
#echo "$count12"

#salary12="$( paste -sd+ wages.csv | sed -E 's/[0-9],/ /g' | sed -E 's/male,/ /g' | sed -E 's/[1] / /g'| sed -E 's/ //g')"

#echo "$salary12"

#echo "($salary12)/$count12" | bc

#count16="$(cat "$1" | sort -t ',' -k 3,3n | head -n 3295 | tail -n 15 | wc -l)"
#echo "$count16"
