LIGHT_IDX=$1
IS_ON=$2
BRI_VAL=$3
X_VAL=$4
Y_VAL=$5
if [ $# != 5 ];
then
	echo usage: ./HueControllerSimple [idx] [is_on] [bri] [x] [y]
	echo "(is_on should be 0 or 1)"
        exit
fi

if [ ! -f api.txt ];
then
	echo ERROR: please add an api.txt with an authorized key!
	exit
fi

if [ ! -f ip.txt ];
then
	echo ERROR: please add an ip.txt with IP of bridge!
	exit
fi

echo LIGHT_IDX = "${LIGHT_IDX}"
echo IS_ON = "${IS_ON}"
echo BRI_VAL = "${BRI_VAL}"
echo X_VAL = "${X_VAL}"
echo Y_VAL = "${Y_VAL}"
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

JSON_DATA="{"\"on\":${tf_str},\"bri\":${BRI_VAL},\"xy\":[${X_VAL},${Y_VAL}]"}"






echo JSON_DATA = ${JSON_DATA}

curl --request PUT --data ${JSON_DATA} ${BASE_URL} --max-time 5
