NUM_LIGHTS=$1
for ((i=1; i <= $1; i++)); do
   echo Light $i:
   ./HueIsOnQuery.sh $i
done
