#!/bin/bash

port=80

echo "Ingrese IPs de hosts con el puerto $port abierto:"
read hosts

for host in $hosts; do
	echo $host: $(printf "GET / HTTP/1.0\r\n\r\n" | nc $host $port | wc -c)
done
