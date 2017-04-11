#!/bin/bash

files=($(ls))

echo "Los archivos de este directorio: ${files[@]}"

exists=$(ls | grep -c libro.txt)

if [ $exists -gt 0 ]; then
	echo "Existe al menos 1 archivo libro.txt, borrandolo."
	rm libro.txt
else
	echo "No existe libro.txt, creandolo."
	touch libro.txt
fi

for f in "${files[@]}"; do
	echo "Procesando el archivo $f"
	if [ $f != "libro.txt" ]; then	
		cat $f >> libro.txt
	fi
done

echo "Mostrando libro.txt"
cat libro.txt

exit 0
