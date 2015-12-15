NUM_LIGHTS=$1

#first, turn everything on
for ((i=1; i<=$1; i++)); do
   ./HueControllerSimple.sh $i 1 255 0.33 0.33
done
#we want to just set colour only, as turning
#lights "on" takes 400ms due to default fade-in
while true; do
   XY_VAL=`./getXY.sh Blue`
   for ((i=1; i<=$1; i++)); do
      ./setXY.sh $i $XY_VAL 

   done
   sleep 2;
   XY_VAL=`./getXY.sh Red` 
   for ((i=1; i<=$1; i++)); do
      ./setXY.sh $i $XY_VAL
   done
   sleep 2;
 
   XY_VAL=`./getXY.sh Green` 
   for ((i=1; i<=$1; i++)); do
      ./setXY.sh $i $XY_VAL
   done
   sleep 2;

   XY_VAL=`./getXY.sh White`
   for ((i=1; i<=$1; i++)); do
      ./setXY.sh $i $XY_VAL 

   done
   sleep 2;
done
 
 
