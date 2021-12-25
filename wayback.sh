#!/bin/bash


filein=$1

fileout=$2

tmpfile="tmp.txt"



if [[ ("$filein" == "-h") || ("$filein" == "") || ("$fileout" == "")]]; then

        echo "Type domains file name first, and space separated output file name second";

        exit 1;

fi


while IFS= read -r line

        do

                assetfinder "$line" | waybackurls | grep 'https' | grep 'PS9\|folder=\|download=\|file=\|dest=\|html=\|continue=\|=%3D\|=%2F\|%3D%2F\|return_to\|redirect_uri\|next=\|=/\|host=\|path=\|src=\|imgurl\|file=\|u=\|link=\|url=\|https%3A\|aHR0cHM6Ly' | grep -v 'utm_source\|utm_content\|metric\|signin\|signup\|login\|authorize\|click\|embed\|web.archive.org\|counter\|analytics\|utm_referrer';
                          

        done < "$filein" > "$tmpfile"


cat "$tmpfile" | /root/tools/urldedupe/./urldedupe -s > "$fileout"; #path to urldedupe tool

rm "$tmpfile";

wc "$fileout";


