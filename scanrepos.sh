prog_name=$1;
page_amount=$2;
one=1;
page_amount_minus_1="$(($2-$one))"



if [[ ("$prog_name" == "-h") || ("$prog_name" == "")]]; then

        echo "Type program name pios. Esli nado, pishi kolichestvo stranic vtorim argumentom";

        exit 1;

fi

	echo -e "Sobiraem pervuy stranicu"; 



	curl --silent "https://github.com/$prog_name" | grep -oP '(?<=\" href=\"\/'$prog_name'\/).*(?=class)' | tr -d '\"' >> repos




if [[ ("$page_amount" != "")]]; then


	echo -e "Sobiraem eshe" $page_amount_minus_1 "stranic"; 



	for (( i=2; i<=$page_amount+1; i++ )) do

		curl --silent "https://github.com/$prog_name?page=$i" | grep -oP '(?<=\" href=\"\/'$prog_name'\/).*(?=class)' | tr -d '\"' >> repos


	done

        

fi


	wc repos; echo -e "Stolko vsego repo"




while IFS= read line

	do 


          
            gitleaks --repo-url=https://github.com/$prog_name/$line --verbose
		 



	done < repos | grep '\"' > gitout

rm repos; 
