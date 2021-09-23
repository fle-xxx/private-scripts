filein=$1 #parses output file of brutedir.sh or outlittle


        IFS=$'\n' read -d '' -r -a lines < "$filein"




        for i in ${!lines[@]}

                do

                        a=$((i+1))
                        j=$((i-4))
                        k=$((i+4))

                        if [[ ${lines[$i]} == *"Words:"* ]]; then
  

                                if [[ ("${lines[$i]}" != "${lines[$k]}") && ("${lines[$i]}" != "${lines[$j]}") ]]; then


                                        echo ${lines[$i]}; echo ${lines[$a]}; echo -en '\n'; #echo ${lines[$b]}; echo ${lines[$c]}; echo "\n"; 

                                fi

                        fi


                done
