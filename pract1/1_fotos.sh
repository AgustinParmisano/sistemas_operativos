#!/bin/bash

list_dirs=($(ls -l | grep '^d' | cut -d" " -f10))

echo "PWD: " $(pwd)

echo "Dirs: " ${list_dirs[*]}

archs=($(ls $list_dirs))

#echo "Files: " ${archs[*]}

for dir in "${list_dirs[@]}"; do
	echo "Procesando directorio: " $dir
	nom=$dir
	files=($(ls $dir))
	echo "Files: " ${files[*]}
	i=1
	for f in "${files[@]}"; do
		echo "Procesando file: " $f
		ext=$(echo $f|cut -d"." -f2)
		newf="$nom-$i.$ext"
		echo "Renombrando $f a $newf"
		$(mv $dir/$f $dir/$newf)
		i=$(expr $i + 1)
	done
done

exit 0

