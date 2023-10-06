# Problem 1
# Obtains female lines and sorts by unique second column values
# Replaces "," delimiter with a space
# Creates file "wages_formatted.csv"

grep "female" wages.csv |sort -t , -k 2,2 -nu | tr ',' ' ' > wages_formatted.csv;

# Does same as previous line but uses regular expressions to capture the word "male" for the first column and appends it to previously created file

grep -E ^"male" wages.csv | sort -t , -k 2,2 -nu | tr ',' ' ' >> wages_formatted.csv;


# Problem 2
# Sorts by wage column
# Prints highest earner, lowest earner, and top ten female earners with headings for each column
# Top ten earners category is reversed based on wages column so that the highest wage is at the top

echo "highest earner:";
echo "gender,yearsExperience,wage";
sort -t , -k 4,4 wages.csv | tail -2 | head -1 | cut -d , -f 1,2,4;

echo "lowest earner:";
echo "gender,yearsExperience,wage";
sort -t , -k 4,4 wages.csv | head -1 | cut -d , -f 1,2,4;

echo "top ten female earners:";
echo "gender,yearsExperience,wage";
grep "female" wages.csv | sort -t , -k 4,4 | tail -11 | head -10 | sort -t , -k 4,4 -r | cut -d , -f 1,2,4;



#Problem 3
# Find lowest wage earned with 12 years of education and name as val2 and print
# Find lowest wage earned with 16 years of education and name as val1 and print
# Perform basic calculation to determine the difference in the lowest wage earned by a college graduate and highschool graduate

val2=$(grep -E .*,.*,12,.* wages.csv | sort -t , -k 3,3 -n | head -1 | cut -d , -f 4,4);
val1=$(grep -E .*,.*,16,.* wages.csv | sort -t , -k 3,3 -n | head -1 | cut -d , -f 4,4);
echo "Lowest wage for high school education:";
echo "$val2";
echo "Lowest wage for college education:";
echo "$val1";
echo "Difference between lowest wage earned by college and highschool graduate:"
echo "$val1 - $val2" | bc
