#!/bin/bash

BEFORE="$(df -h | grep "$(whoami)" | awk {'print $4'})"

if [ -z "$1" ]; then
	echo -e $'\e[38;5;196mFree space Before:' $BEFORE $'\e[0m'
	find ~ -name "ipch" -exec rm -rfv {} \;
	AFTER="$(df -h | grep "$(whoami)" | awk {'print $4'})"
	echo -e $'\e[38;5;46mFree space After:' $AFTER $'\e[0m'
	echo -e $'\e[38;5;46mDone.\e[0m'
	exit
fi

default_remove_after_ask() {
	echo -n " (yes or no) -> "
	read is_remove
	if [ "$is_remove" == "yes" ]; then
		echo -e $'\e[38;5;196mFree space Before:' $BEFORE $'\e[0m'
		find ~ -name "ipch" -exec rm -rfv {} \;
		AFTER="$(df -h | grep "$(whoami)" | awk {'print $4'})"
		echo -e $'\e[38;5;46mFree space After:' $AFTER $'\e[0m'
	else
		echo "Cancellation deleting from ~."
	fi
}

if [ "$1" == "-f" ]; then
	if [ -z "$2" ]; then
		echo "Missing argument for -f. Search starts from ~."
		find ~ -name "ipch"
	else
		find "$2" -name "ipch"
	fi
	echo -e "\033[32mDone.\033[0m"
elif [ "$1" == "-p" ]; then
	if [ -z "$2" ]; then
		echo -n "Missing argument for -p. Removing will starts from ~."
		default_remove_after_ask
	else
		echo -e $'\e[38;5;196mFree space Before:' $BEFORE $'\e[0m'
		find "$2" -name "ipch" -exec rm -rfv {} \;
		AFTER="$(df -h | grep "$(whoami)" | awk {'print $4'})"
		echo -e $'\e[38;5;46mFree space After:' $AFTER $'\e[0m'
		echo -e "\033[32mDone.\033[0m"
	fi
elif [ "$1" == "-q" ]; then
	if [ -z "$2" ]; then
		echo -n "Missing deleting directory path for -q(1 argument). Removing will starts not quiet from ~."
		default_remove_after_ask
	elif [ -z "$3" ]; then
		echo -n "Missing quiet mode output path to file for -q(2 argument). Removing will starts not quiet from ~."
		default_remove_after_ask
	else
		find "$2" -name "ipch" -exec rm -rfv {} \; >> "$3"
		echo -e "\033[32mDone.\033[0m"
	fi
else
	echo "Incorrect argument."
	exit
fi
