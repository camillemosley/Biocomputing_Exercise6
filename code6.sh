#makes a file with all unique gender-years of experience combinations, sorted by gender and then years of experience
#prints info for highest and lowest earners, also number of females in the top 10 of earners
#also prints the difference in earnings between the lowest college grad and the lowest jus high school grad

# usage: bash code6.sh file.csv

cat "$@" | tail -n +2 | cut -d , -f 1,2 | sort -u -t , -k 1,1 -k 2,2n | sed -E 's/,/ /g' > gender_exp.csv

echo "Highest Earner:"
cat "$@" | tail -n +2 | sort -t , -k 4,4rn | head -n 1 | cut -d , -f 1,2,4
echo "Lowest Earner:"
cat "$@" | tail -n +2 | sort -t , -k 4,4rn | tail -n 1 | cut -d , -f 1,2,4
echo "Females in Top Ten:"
cat "$@" | tail -n +2 | sort -t , -k 4,4rn | head -n 10 | grep -c "female"

college=$(cat "$@" | tail +2 | cut -d , -f 3,4 | grep "^16" | sort -t , -k 2,2n | head -n 1 | cut -d , -f 2)
high_school=$(cat "$@" | tail +2 | cut -d , -f 3,4 | grep "^12" | sort -t , -k 2,2n | head -n 1 | cut -d , -f 2)
echo "College effect on lowest wage:"
echo "$college - $high_school" | bc

