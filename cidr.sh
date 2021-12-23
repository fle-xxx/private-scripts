filein=$1 #cidr scope file


        while IFS= read line

                do 

                        nmap -sL -n $line | grep 'Nmap scan report for' | cut -f 5 -d ' ' >> cidr


                done <"$filein"

	sort -u -o cidr cidr;

	wc cidr;


