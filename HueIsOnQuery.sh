LIGHT_IDX=$1
if [ $# != 1 ];
then
	echo usage: ./HueIsOnQuery [idx]
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

#echo LIGHT_IDX = "${LIGHT_IDX}"
API_KEY=`cat api.txt`
#echo API_KEY = "${API_KEY}"
IP_ADDR=`cat ip.txt`
#echo IP_ADDR = "${IP_ADDR}"
BASE_URL="http://${IP_ADDR}/api/${API_KEY}/lights/${LIGHT_IDX}/"
#echo BASE_URL = "${BASE_URL}"

#assemble json data here

curl -s ${BASE_URL} --max-time 5 | grep -Po '(?<="on":).*(?=\,"bri")' 
