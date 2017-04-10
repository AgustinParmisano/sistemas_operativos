#!/bin/bash

user=$(whoami)

echo "Usuario que lo ejecutra: $user"

userhome="/home/$user"

echo "Home del usuaurio: $userhome"

if [ -x $userhome/backup/ ]; then
	echo "Existe el directorio $userhome/backup borrando contenido"
	rm -r $userhome/backup/
fi

echo "Creando directorio $userhome/backup/"
mkdir "$userhome/backup/"

pwd=$(pwd)

files=($(ls $userhome))

echo "Files del home: $userhome/$files"

cd "$userhome/backup/"

echo "Estoy en $(pwd)"

for f in "${files[@]}"; do
	echo "Procesando el archivo $userhome/$f"
	if [ -f "$userhome/$f" ]; then
		echo "$userhome/$f es un archivo copiandolo a $userhome/backup/"		
		cp "$userhome/$f" "$userhome/backup/$f"
		filename=($f)
		for i in "${filename[@]}"; do
			mv "$i" "$(echo "$i" | tr '[a-z]' '[A-Z]')"
		done
	fi
	
	if [ -d "$userhome/$f" ]; then
		echo  "$userhome/$f es un directorio"
	fi
done

cd $pwd

echo "Terminado."

exit 0
