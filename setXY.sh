LIGHT_IDX=$1
X_VAL=$2
Y_VAL=$3
if [ $# != 3 ];
then
	echo usage: ./setXY.sh [idx] [x] [y]
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
echo X_VAL = "${X_VAL}"
echo Y_VAL = "${Y_VAL}"
API_KEY=`cat api.txt`
echo API_KEY = "${API_KEY}"
IP_ADDR=`cat ip.txt`
echo IP_ADDR = "${IP_ADDR}"
BASE_URL="http://${IP_ADDR}/api/${API_KEY}/lights/${LIGHT_IDX}/state"
echo BASE_URL = "${BASE_URL}"


JSON_DATA="{"\"xy\":[${X_VAL},${Y_VAL}]"}"






echo JSON_DATA = ${JSON_DATA}

curl --request PUT --data ${JSON_DATA} ${BASE_URL} --max-time 5
