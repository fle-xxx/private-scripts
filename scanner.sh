#!/bin/bash

filein=$1

fileout=$2


if [[ ("$filein" == "-h") || ("$filein" == "")]]; then

	echo "Type domains filename first, and space separated output filename second";

	exit 1;

fi


while IFS= read line
	
	do
        	
		domain=$line
                       
		assetfinder -subs-only $domain | waybackurls | grep 'https' | grep 'url=\|https%3A' | grep -v 'signin\|login\|click\|embed' > $2
                         
	done <"$filein"
