#!/bin/bash

if [[ -z "$1" ]]; then
	find ~ -name "ipch" -exec rm -rfv {} \;
	exit
fi

if [ "$1" == "-f" ]; then
	if [ -z "$2" ]; then
		echo "Missing argument for -f. Search starts from ~."
		find ~ -name "ipch"
	else
		find "$2" -name "ipch"
	fi
elif [ "$1" == "-p" ]; then
	if [ -z "$2"]; then
		echo -n "Missing argument for -p. Removing will starts from ~. (yes or no) -> "
		read is_remove
		if [ "$is_remove" == "yes" ]; then
			find ~ -name "ipch" -exec rm -rfv {} \;
		else
			echo "Cancellation deleting from ~."
		fi
	else
		find "$2" -name "ipch" -exec rm -rfv {} \;
	fi
else
	echo "Incorrect argument."
fi
exit
