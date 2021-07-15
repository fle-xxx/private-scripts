filein=$1 #emails file


root_link="https://calendar.google.com/calendar/htmlembed?src="

rest="&ctz=American/Los_Angeles"


        while IFS= read line

                do 

			url="$root_link$line$rest";

                        res=$(curl -I --silent $url | grep 'HTTP/2 200');


			if [[ ("$res" != "") ]]

                        	then echo -e $url

                        fi



                done <"$filein"
