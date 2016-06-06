# Sets the brightness value of light at index
# (this is faster than turning it on/off and setting brightness at same time)

LIGHT_IDX=$1
BRI_VAL=$2
if [ $# != 2 ];
then
	echo usage: ./HueControllerBri [idx] [bri] 
	echo "(is_on should be 0 or 1; bri = 0 - 255)"
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
echo BRI_VAL = "${BRI_VAL}"
API_KEY=`cat api.txt`
echo API_KEY = "${API_KEY}"
IP_ADDR=`cat ip.txt`
echo IP_ADDR = "${IP_ADDR}"
BASE_URL="http://${IP_ADDR}/api/${API_KEY}/lights/${LIGHT_IDX}/state"
echo BASE_URL = "${BASE_URL}"

#assemble json data here

JSON_DATA="{\"bri\":${BRI_VAL}}"

echo JSON_DATA = ${JSON_DATA}

curl --request PUT --data ${JSON_DATA} ${BASE_URL} --max-time 5
