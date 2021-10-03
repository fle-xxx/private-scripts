filein=$1 #scope domains file


        while IFS= read line

                do 

                        amass enum -active -brute -d $line >> subN;


                done <"$filein"



        while IFS= read line

                do 

                        assetfinder --subs-only $line >> subN;


                done <"$filein"
		
		

        sort -u subN >> sub;

	rm subN;

	cat scope >> sub; sort -u -o sub sub;

        wc sub;
