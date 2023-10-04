#wages.sh: Take a csv file of wage data and return a file that sorts the data first by gender and then 
#by yearsExperience; tells the gender, yearsExperience, and wage of the highest and lowest earner as 
#well as the number of females in the top 10 earners

#usage: bash wages.sh wages.csv

#the following line sorts the file by gender in line 1 and then by 
#YearsExperience in line 2

cut -d , -f 1,2 "$1" | sort -t "," -k1,1 -k2,2n | tr ',' ' ' > wagessorted.csv

#returns the gender, years experience, and wage of the highest earner
echo "highest earner"
cut -d , -f 1,2,4 "$1" | sort -t "," -k 4,4n | tail -n 1

#returns the gender, years experience, and wage of the lowest earner
echo "lowest earner"
cut -d , -f 1,2,4 "$1" | sort -t "," -k 4,4n | head -n 2 | tail -n 1

#returns the number of females in the 10 top earning individuals
echo "number of females in the top 10 earning individuals"
sort -t "," -k4,4nr "$1" | head -n 10 | grep "female" | wc -l

