#!/bin/bash
type=0
top=10
path=

for arg in "$@"; do
	case $arg in
		-a) type=1;
		shift;
		;; 
		-n) top=$2;
		shift;
		shift;
		;;
		*) path=$1;
		;;		 
esac
done
echo $type
if [ "$type" -eq 0 ]; 
	then 
	du -h $path | sort -rh | head -n $top
else
	du -ah $path | sort -rh | head -n $top	
fi
