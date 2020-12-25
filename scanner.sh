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
        	
        	assetfinder -subs-only "$line" | waybackurls | grep 'https' | grep 'return_to\|redirect_uri\|next=\|=/\|host=\|path=\|src=\|imgurl\|file=\|u=\|link=\|url=\|https%3A\|aHR0cHM6Ly' | grep -v 'utm_source\|utm_content\|metric\|signin\|signup\|login\|authorize\|click\|embed\|web.archive.org\|counter\|analytics\|utm_referrer';

                                 
        done < "$filein" > "$tmpfile"



sort -u "$tmpfile" > "$fileout";

rm "$tmpfile"
