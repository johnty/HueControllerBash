n=0;

while [[ $# > 1 ]] 
do
   key="$1"
   n=$((n+1));
   case $key in
	-l)
	LIGHT_IDX="$2"
	shift
	;;
	-o)
	IS_ON="$2"
	shift
	;;
	-b)
	BRI_VAL="$2"
	shift
	;;
	-h)
	HUE_VAL="$2"
	shift
	;;
	-s)
	SAT_VAL="$2"
	shift
	;;
	--default)
	DEFAULT=YES
	;;
	*)
	;;
   esac
   shift
done

n=$((n-1))
echo NUM_OPT_ARGS = "${n}"
echo LIGHT_IDX = "${LIGHT_IDX}"
echo IS_ON = "${IS_ON}"
echo BRI_VAL = "${BRI_VAL}"
echo HUE_VAL = "${HUE_VAL}"
echo SAT_VAL = "${SAT_VAL}"
API_KEY=`cat api.txt`
echo API_KEY = "${API_KEY}"
IP_ADDR=`cat ip.txt`
echo IP_ADDR = "${IP_ADDR}"
BASE_URL="http://${IP_ADDR}/api/${API_KEY}/lights/${LIGHT_IDX}/state"
echo BASE_URL = "${BASE_URL}"
if [ ${IS_ON} = "0" ]; #string compare. not numerical!
then
	tf_str="false"
else
	tf_str="true"
fi


#assemble json data here
JSON_DATA="{"

if [ -n "$IS_ON" ]
then JSON_DATA=${JSON_DATA}"\"on\":${tf_str}"
fi;

#add a comma if not last opt
if [ $n -gt 1 ] 
   then JSON_DATA="${JSON_DATA}",
fi;
n=$((n-1))

if [ -n "$BRI_VAL" ]
then JSON_DATA=${JSON_DATA}"\"bri\":${BRI_VAL}"
fi;

#add a comma if not last opt
if [ $n -gt 1 ] 
   then JSON_DATA="${JSON_DATA}",
fi;
n=$((n-1))

if [ -n "$HUE_VAL" ]
then JSON_DATA=${JSON_DATA}"\"hue\":${HUE_VAL}"
fi;

#add a comma if not last opt
if [ $n -gt 1 ] 
   then JSON_DATA="${JSON_DATA}",
fi;
n=$((n-1))

if [ -n "$SAT_VAL" ]
then JSON_DATA=${JSON_DATA}"\"sat\":${SAT_VAL}"
fi;




JSON_DATA=${JSON_DATA}"}" #close bracket
echo JSON_DATA = ${JSON_DATA}

curl --request PUT --data ${JSON_DATA} ${BASE_URL} --max-time 5
