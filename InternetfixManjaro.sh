for i in $(iw dev wlp2s0 scan|grep Hasennetz)
#scans Wlan device wlp2w0 for ssid Hasennetz and lists them
do
	Netzwerk=$i
#saves last list item, but all are the same
done
if [ $Netzwerk = "Hasennetz" ]
#checks for the network
then
	x=60
	#Default Time Between Checks
	while true
	#wont turn off
	do
		if  ping -c 1 8.8.8.8
		#checks if google servers are reachable
		then
			sleep $x
			#if yes wait a set amount of time
		else
			ip link set wlp2s0 down
			#turns off the wifi device
			sleep 1
			ip link set wlp2s0 up
			# waits an set it back on
			x=5
			#sets the timer to 5 seconds since problems occured
			sleep $x
		fi
		sleep $x
		#extra wait time to not harras google too much
	done
fi
