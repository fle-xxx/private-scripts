filein=$1 #scope domains file


        while IFS= read line

         do 

         	amass enum -active -brute -d $line >> subN;


         done <"$filein"



        while IFS= read line

        do 

        	assetfinder --subs-only $line >> subN;


        done <"$filein"


	#while IFS= read line

        #do

		#curl -fsSL -path-as-is "https://crt.sh/?CN=%25.""{$line}" | grep $line | sort -n | uniq -c | sort -r | column -t | grep -v '\*\|\#' | sed 's/^....//' | sed 's/[[:space:]]*$//' | grep '<TD>' | grep -oE '[[:alnum:]]+[.][[:alnum:]_.-]+' | grep $line >> subN;
		
		
	#done <"$filein"


        sort -u subN >> sub;

	rm subN;

	cat scope >> sub; sort -u -o sub sub;

        wc sub;
