IDX=$1
COL=$2
echo setting light $IDX to colour $2...
VAL_X="$(./getX.sh $COL)"
VAL_Y="$(./getY.sh $COL)"
echo got x= $VAL_X y= $VAL_Y
./setXY.sh $IDX $VAL_X $VAL_Y
