filein=$1


        while IFS= read line

                do 

                        amass enum -active -d $line >> sub;


                done <"$filein"



        while IFS= read line

                do 

                        amass enum -passive -d $line >> sub;


                done <"$filein"



        while IFS= read line

                do 

                        assetfinder $line >> sub;


                done <"$filein"


	/root/scripts/./curlprobe.sh sub upzpt;

	sed 's/........$//' upzpt > up; 

	wc up;
