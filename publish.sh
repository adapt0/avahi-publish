#!/bin/sh
# set -v

if [ ! -S "/run/dbus/system_bus_socket" ]; then
	echo "Need to bind /var/run/dbus"
	exit 1
fi
if [ "$#" -lt 1 ]; then
	echo "Specify (host1) (host2) ..."
	exit 1
fi

hostname=$(dbus-send --system --dest=org.freedesktop.hostname1 --print-reply /org/freedesktop/hostname1 org.freedesktop.DBus.Properties.Get string:org.freedesktop.hostname1 string:Hostname | sed -n 's/.*"\([^".]*\)[^"]*".*/\1/p')
hostIp=$(avahi-resolve -4 -n "$hostname.local" | cut -f 2)

for a in "$@"; do
        echo "$a"
        avahi-publish -a -R "$a.local" $hostIp &
done
wait
