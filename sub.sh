filein=$1 #scope domains file


        while IFS= read line

                do 

                        amass enum -active -d $line >> subN;


                done <"$filein"



        while IFS= read line

                do 

                        amass enum -passive -d $line >> subN;


                done <"$filein"



        while IFS= read line

                do 

                        assetfinder --subs-only $line >> subN;


                done <"$filein"
		
		

        sort -u subN > sub;

	rm subN;

        wc sub;
