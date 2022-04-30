#!/bin/bash


filein=$1 # http/s:// url file

filesub=filesub

grep -r -h -Eo '[^/"]+' $filein | grep -v 'http' >> $filesub;

#sort -u -o $filesub $filesub;


        while IFS= read line

                do 


			

                        addr=$(nslookup $line | grep 'Address' | grep -v '#' | sed 's/^.........//')

                        echo -n $line; echo -n ','; 
			echo -n $addr; echo -en '\n'; 


                done <"$filesub"

rm filesub;
