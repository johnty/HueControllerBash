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

BRI1=0
ON1=0

#trap ctrl_c
trap ctrl_c INT

function ctrl_c() {
   echo -e "\n\nExiting... turning off lights"
   on_off 0 
   exit 0
}

function on_off() {

   ./HueOnOff.sh 1 $1 &> /dev/null
   ./HueOnOff.sh 2 $1 &> /dev/null
   ./HueOnOff.sh 3 $1 &> /dev/null
   ./HueOnOff.sh 4 $1 &> /dev/null
   ON1="$1"
}

echo PiShield Hue Sensor and RGB Hue Lights demo
cd .. # go up dir since all tools are there...

# Lets turn on some lights!
# (in this case, the first 4...)

on_off 1
./HueColour.sh 2 Blue
./HueColour.sh 3 Green
./HueColour.sh 4 Red

while true;
do
   #read Analog ch 0:
   SENS1=`gpio -x mcp3004:100:0 aread 100`
   SENS2=`gpio -x mcp3004:100:0 aread 101`
   SENS3=`gpio -x mcp3004:100:0 aread 102`
   BRI1=`expr $SENS1 / 4`
   #echo BRI = $BRI
   #set Hue brightness
   if [ "$BRI1" -gt 10 ];
   then
      if [ "$ON1" -eq 0 ];
      then
         echo "was off, turn on"
         on_off 1
      fi
      ./HueControllerBri.sh 2 $BRI1 &> /dev/null
      ./HueControllerBri.sh 3 $BRI1 &> /dev/null
      ./HueControllerBri.sh 4 $BRI1 &> /dev/null
   else
      if [ "$ON1" -eq 1 ];
      then
         echo was on, turn off
         on_off 0
      fi
   fi

   if [ "$SENS2" -gt 700 ];
   then
      ./HueColour.sh 2 Red &> /dev/null
      ./HueColour.sh 3 Red &> /dev/null
      ./HueColour.sh 4 Red &> /dev/null
   fi

   if [ "$SENS2" -lt 650 ];
   then
      if [ "$SENS2" -gt 300 ];
      then
         ./HueColour.sh 2 Blue &> /dev/null
         ./HueColour.sh 3 Yellow &> /dev/null
         ./HueColour.sh 4 Red &> /dev/null
      fi
      if [ "$SENS2" -lt 250 ];
      then
         ./HueColour.sh 2 White &> /dev/null
         ./HueColour.sh 3 White &> /dev/null
         ./HueColour.sh 4 White &> /dev/null
      fi
   fi

   echo $SENS1 $SENS2 $SENS3
   sleep 0.1
done
