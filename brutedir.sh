#!/bin/bash


filein=$1

fileout=$2



if [[ ("$filein" == "-h") || ("$filein" == "")] || ("$fileout" == "")]]; then

	  echo "Type domains file name first, and space separated output file name second";

	  exit 1;

fi



while IFS= read -r line

    do

        echo -e "Domain: $line"; echo -e "Protocol: https";

        ffuf -w /root/wordlists/big.txt -u https://"$line"/FUZZ -t 80 -maxtime 600; 

        echo -e 'Protocol: http'; 

		    ffuf -w /root/wordlists/big.txt -u http://"$line"/FUZZ -t 80 -maxtime 600;


    done < "$filein" > "$fileout";

# after to see pretty results execute: sed "s/[\^@]//g" outfile.txt
