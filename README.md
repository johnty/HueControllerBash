#HueControllerBash

A few simple bash scripts for controlling hue lights using curl commands. contains some personal learning experiments with bash scripting, as well as rudimentary interactions with the Philips Hue API. Comments, corrections, suggestions and requests welcome!

##HueControllerSimple.sh:
A simple script that allows you to specify the index, on/off, brightness, and x/y gamut value of a light on a bridge.

**requires**: 
* api.txt in the same folder containing the API string. See [this](http://www.developers.meethue.com/documentation/getting-started) for details.
* ip.txt with ip address of bridge (e.g. 192.168.1.123)

usage: ./HueControllerSimple [idx] [is_on] [bri] [x] [y]

**note**: no input validation is performed!

---

##HueController.sh:
Similar to above, but a more complicated script that takes in variable number of inputs:

usage:

./HueController -l [light index] -o [on/off] -b [brightness] -h [hue] -s [sat]

apart from the light index, other parameters are optional

requires two .txt files in the same folder:

api.txt containing the API key
ip.txt containing the IP address of the bridge

---

###colours.txt

Table grabbed off the hue website, used by following utility script for grabbing the X and Y gamut values for given colour names in English

---

###getX.sh, getY.sh

Utility scripts for getting the single floating point gamut values from list of colours. Kinda hacky, and the {print $4} line is associated with "Gamut A", which is for the first version of the hue lights with kinda crappy range. Replace with {print $4} or {print $5} if you have newer bulbs with Gamut B or C support.

---

###HueSetLightColour.sh

Script that takes a light index and name of colour in English (see colours.txt for full list) and sets it. Default to "on" (obviously), and full brightness. Should be the starting point for making more interesting effects involving more lights, timings, etc.

---

more to come!



johnty wang, nov 2015
(info at [firstname].ca)
