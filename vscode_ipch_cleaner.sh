#!/bin/bash

if [ "$1" == "" ]; then
	find ~ -name "ipch" -exec rm rfv {} \;
	exit
fi

if [ "$1" == "-f" ]; then
	find ~ -name "ipch"
elif [ "$1" == "-p" ]; then
	if [ "$2" != "" ]; then
		find $2 -name "ipch" -exec rm rfv {} \;
	else
		echo "Missing argument for -p."
	fi
else
	echo "Incorrect argument." 
fi
