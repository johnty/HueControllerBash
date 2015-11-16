simple bash script for controlling hue lights using curl commands.

usage:

./HueController -l [light index] -o [on/off] -b [brightness] -h [hue] -s [sat]

apart from the light index, other parameters are optional

requires two .txt files in the same folder:

api.txt containing the API key
ip.txt containing the IP address of the bridge

this is a very first version, so comments, suggestions, corrections, etc are welcome!

this was mostly inspired when trying to figure out how to manually craft PUT commands to control the bridge. the core syntax looks like:

curl --request PUT --data '{"on":true}' http://[ip address]/api/[api_key]/lights/[x]/state

and this particular script simply allows you to chain a few extra commands and hacks together a properly formatted JSON payload to be sent via curl to the bridge.

johnty wang, nov 2015
(info at [firstname].ca)
