COLOUR=$1
#echo Retreiving X value for ${COLOUR}
tmp="/\t${COLOUR}\t(/p"
#echo tmp= ${tmp}
VAL="$(sed -n -e "${tmp}" colours.txt | awk -F '\t' '{print $4}' | tr -d '[]' | awk -F ',' '{print $1}')"

#X_VAL="$(sed -n -e '/\tGreen\t(/p' colours.txt | awk -F '\t' '{print $4}' | tr -d '[]' | awk -F ',' '{print $1}')"

echo ${VAL}
