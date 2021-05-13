filein=$1 #scope domains file


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


	cat sub | httprobe -p http:8080 -p http:81 > uphosts

	wc uphosts;
