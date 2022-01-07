#!/bin/bash


url=$1





if [[ ("$url" == "-h") || ("$url" == "") ]]; then

	echo "Type site or js file url";

	exit 1;

fi




python3 /root/tools/LinkFinder/linkfinder.py -i $url -d -o cli | grep -v -e 'multipart\/\|UTC\|Pacific\|Australia\|Asia\|MM\|DD\|YY\|application\/\|Africa\|America\|GMT\|Europe\|text\/css\|image\/jpeg\|favicon\.ico\|\.js\|^\.\|w3\.org\|^$\|\.png\|\.jpg\|googletagmanager\|google-analytics\|facebook\|instagram\|google\.com\|apple\.com\|\.css\|appgallery\|\.gtm\.js'
