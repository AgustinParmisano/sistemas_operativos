#!/bin/bash

list=($(ls))
size=${#list[*]}
size=$(expr $size - 1)
newlist=()
i=0

echo "Lista de archivos del directorio actual: ${list[*]}"
echo "Tamaño de lista de archivos: $size"

for f in "${list[@]}"; do
	newlist[i]=${list[$size]}
	#echo "Fin de lista: ${list[$size]}"
	i=$(expr $i + 1)
	#echo "i es $i"
	#echo "size es $size"
	size=$(expr $size - 1)
done

echo "Lista de archivos inversa ${newlist[*]}"

exit 0
