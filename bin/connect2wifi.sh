#!/bin/sh

## To get the list of available wifi access points, type:
# nmcli d wifi
#
# To connect to a wifi access point specified by a SSID (here EEE), type:
# # nmcli d wifi connect EEE password '12345678901234567890123456'
#
# To request that NetworkManager rescans for available access points, type:
# nmcli radio wifi on
# nmcli d wifi rescan
# nmcli connect # shows available networks
# nmcli d # shows current connections

connect2wifi() {
		if [ "$1" = "Lambda" ]
		then
				echo "connecting to Lambda..."
				nmcli --ask c up uuid c08ca1ba-aee6-455a-888d-8563753fa797
		elif [ "$1" = "FreeStation" ]
		then
				echo "connecting to FreeStation..."
				nmcli c up uuid 578f4b92-c99a-482e-a310-fe36aa0afc4e
		else
				echo "connecting to MADHotspot..."
				nmcli --ask c up uuid 09db4507-d855-40b4-becc-462f0f31811b
		fi
}

# sudo ifconfig wlp4s0 up
connect2wifi $1
		