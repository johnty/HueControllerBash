simple bash script for controlling hue lights using curl commands.

usage:

./HueController -l [light index] -o [on/off] -b [brightness] -h [hue] -s [sat]

apart from the light index, other parameters are optional

requires two .txt files in the same folder:

api.txt containing the API key
ip.txt containing the IP address of the bridge

this is a very first version, so comments, suggestions, corrections, etc are welcome!

johnty wang, nov 2015
(info at [firstname].ca)
