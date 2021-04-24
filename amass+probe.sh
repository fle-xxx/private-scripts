filein=$1


        while IFS= read line

                do 

                        amass enum -active -d $line >> sub.txt;


                done <"$filein"


	/root/scripts/./curlprobe.sh sub.txt upzpt.txt;

	sed 's/........$//' upzpt.txt > up.txt; 

	wc up.txt;

	rm sub.txt; 
