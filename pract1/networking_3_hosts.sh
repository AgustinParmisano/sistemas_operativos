#!/bin/bash

timeout=1
port=80

echo "Ingrese IPs de hosts: "
read hosts

for host in $hosts; do
	echo "Analizando host: $host"
	nc -w $timeout $host $port
	if [ $? -eq 0 ]; then
		echo "$host está conectado al puerto $port"
	fi
done
