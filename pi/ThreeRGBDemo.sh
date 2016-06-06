# Commandline demo of interaction with multiple sensors
# and Philips Hue RGB lights. Part of a larger suite of scripts here: 
# https://github.com/johnty/HueControllerBash
#
# Sensor interface designed for the Infusion PiShield system
# (https://infusionsystems.com/pishield)
#   but can be used with a mcp3004/8 connected to
#   the Pi's 1st SPI port with wiringPi installed
#
#

#variables
SENS1=0
SENS2=0
SENS3=0


#trap ctrl_c
trap ctrl_c INT

function ctrl_c() {
   echo -e "\n\nExiting... turning off lights"
   ./HueOnOff.sh 1 0 &> /dev/null
   ./HueOnOff.sh 2 0 &> /dev/null
   ./HueOnOff.sh 3 0 &> /dev/null
   ./HueOnOff.sh 4 0 &> /dev/null
   exit 0
}

echo PiShield Hue Sensor and RGB Hue Lights demo
cd .. # go up dir since all tools are there...

# Lets turn on some lights!
# (in this case, the first 4...)

./HueOnOff.sh 1 1 &> /dev/null
./HueOnOff.sh 2 1 &> /dev/null
./HueOnOff.sh 3 1 &> /dev/null
./HueOnOff.sh 4 1 &> /dev/null

while true;
do
   #read Analog ch 0:
   SENS1=`gpio -x mcp3004:100:0 aread 100`
   SENS2=`gpio -x mcp3004:100:0 aread 101`
   SENS3=`gpio -x mcp3004:100:0 aread 102`
   BRI=`expr $SENS1 / 4`
   #echo BRI = $BRI
   #set Hue brightness
   #./HueControllerBri.sh 1 $BRI &> /dev/null
   echo $SENS1 $SENS2 $SENS3
   sleep 0.1
done
