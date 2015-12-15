NUM_LIGHTS=$1


while true; do

   for ((i=1; i<=$1; i++)); do
      ./HueSetLightColour.sh $i Blue

   done
   sleep 2;
   
   for ((i=1; i<=$1; i++)); do
      ./HueSetLightColour.sh $i Green
   done
   sleep 2;

done
