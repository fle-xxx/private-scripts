#!/bin/bash


filein=$1 # http/s:// url file


rm filesub 2> /dev/null;

filesub=filesub

grep -r -h -Eo '[^/"]+' $filein | sed '/^[[:space:]]*$/d' | grep -v 'http' >> $filesub;

sort -u -o $filesub $filesub;

sed -i '/^[[:space:]]*$/d' $filesub;



rm -r ips 2> /dev/null;


mkdir ips; cd ips;



        while IFS= read line

                do

                        addr=$(nslookup $line | grep 'Address' | grep -v '#' | sed 's/^.........//')

			if [[ ! $addr =~ "a" && ! $addr =~ "b" && ! $addr =~ "c" && ! $addr =~ "d" && ! $addr =~ "e" && ! $addr =~ "f" ]]; then


				echo $line >> "$addr" 2> /dev/null;

				echo $addr >> adresy;

			fi

                done <../"$filesub"



sort -u -o adresy adresy;

sed -i '/^[[:space:]]*$/d' adresy;

wc -l *;

rm adresy;

cd ..; wc $filesub; rm $filesub;

head -n1 --silent ips/* >> clearsub; wc clearsub;

cat clearsub | httprobe -prefer-https -p https:8443 -p https:81 -p https:8080 -p https:8000 >> clearuphosts; sort -u -o clearuphosts clearuphosts; wc clearuphosts

