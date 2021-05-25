#!/bin/bash


filein=$1

fileout=$2



if [[ ("$filein" == "-h") || ("$filein" == "") || ("$fileout" == "") ]]; then

	echo "Type hosts file name first, and space separated output file name second";

	exit 1;

fi



while IFS= read -r line

	do

		ffuf -w /root/wordlists/big.txt -u $line/FUZZ -v -ac -timeout 5 -fc 403,401 -fs 0


        done < "$filein" > "$fileout"; 



wc $fileout; 
