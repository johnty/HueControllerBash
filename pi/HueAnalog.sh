#set brightness of 1st lightbulb according to first analog channel
# of a mcp3004/8 connected to SPI0

#trap ctrl_c
trap ctrl_c INT

function ctrl_c() {
   echo "Goodbyte!"

   exit 0
}
echo PiShield Hue Brightness Controller...
cd .. #other scripts in parent folder!
while true;
do
   #read Analog ch 0:
   VAL=`gpio -x mcp3004:100:0 aread 100`
   BRI=`expr $VAL / 4`
   #echo BRI = $BRI
   #set Hue brightness
   ./HueControllerBri.sh 1 $BRI &> /dev/null
   sleep 0.1
done
