#!/bin/bash

#На вход даётся файл с доменами без протоколов. В каждой строчке один домен. На выходе - ответы по http/s

filein=$1

fileout=$2



        while IFS= read line


                do 


                        res1=$(curl -o /dev/null -s -w "%{http_code}\n" https://$line --connect-timeout 5)
                        res2=$(curl -o /dev/null -s -w "%{http_code}\n" http://$line --connect-timeout 5)


                        echo -n $line; echo -n ','; echo -n $res1; echo -n ','; echo -n $res2; echo -en '\n'; 


                done <"$filein" | grep '200,\|403,\|404,\|401,\|405,\|204,\|206,\|400,\|406,\|410,\|500,\|501,\|502,\|503,\|,200\|,403\|,404\|,401\|,405\|,204\|,206\|,400\|,406\|,410\|,500\|,501\|,502\|,503' > "$fileout"

