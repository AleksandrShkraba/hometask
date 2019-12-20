#!/bin/bash
delim="#"
mod=1
path=

for arg in "$@"; do
	case $arg in
		-d) delim=$2;
		shift;
		shift;
		;; 
		-W) mod=0;
		shift;
		;;
		*) path=$1;
		;;		 
esac
done
sed -e 's/'$delim'.*$//' $path > temp
mv temp $path
if [ "$mod" -eq 1 ];
then
sed -i '/^[[:space:]]*$/d' $path
sed -i 's/[[:space:]]*$//' $path
fi
