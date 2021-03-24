#!/bin/bash


filein=$1

fileout=$2



if [[ ("$filein" == "-h") || ("$filein" == "") || ("$fileout" == "")]]; then

	echo "Type domains file name first, and space separated output file name second";

	exit 1;

fi



while IFS= read -r line

	do

		echo -e "Domain: $line"; echo -e "Protocol: https";

        	ffuf -w /root/wordlists/little.txt -u https://"$line"/FUZZ -maxtime 20; 

                echo -e 'Protocol: http'; 

		ffuf -w /root/wordlists/little.txt -u http://"$line"/FUZZ -maxtime 20;


        done < "$filein" | grep -v '204\|403\|401\|302\|301\|307\|308\|503' > "$fileout"; 
