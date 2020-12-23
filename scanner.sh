#!/bin/bash

filein=$1

fileout=$2

tmpfile="tmp.txt"


if [[ ("$filein" == "-h") || ("$filein" == "") || ("$fileout" == "")]]; then

	echo "Type domains filename first, and space separated output filename second";

	exit 1;

fi



while IFS= read -r line
	
	do
        	
        	assetfinder -subs-only "$line" | waybackurls | grep 'https' | grep 'url=\|https%3A\|aHR0cHM6Ly' | grep -v 'signin\|login\|click\|embed\|authorize\|web.archive.org\|counter\|utm_referrer';

                                 
        done < "$filein" > "$tmpfile"



sort -u "$tmpfile" > "$fileout";

rm "$tmpfile"
