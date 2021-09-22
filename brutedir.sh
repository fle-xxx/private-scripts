#!/bin/bash


filein=$1

fileout=$2



if [[ ("$filein" == "-h") || ("$filein" == "") || ("$fileout" == "") ]]; then

	echo "Type hosts file name first, and space separated output file name second";

	exit 1;

fi



while IFS= read -r line

	do

		ffuf -w /root/private-scripts/big.txt -u $line/FUZZ -v -ac -timeout 5 -fc 403,401 -fs 1,2,3,4,5,6,7,8,9,10,11,12,13,14


        done < "$filein" > tmp


parseout.sh tmp > $fileout;

rm tmp;

wc $fileout;

#brutedir.sh brutehosts outbrute, host - http://bla.com
