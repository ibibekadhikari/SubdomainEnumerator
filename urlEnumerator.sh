#!/bin/bash
#ATTENTION!! You need to have Subfinder & httpx tools here.

#Subfinder tool is used here to enumerate and find the subdomain of the Domain you provide.
#Httpx will check all the dubdomain by putting http & https protocol by itself
#and verify there status code whether they are 200,400,301 but change grep if you want differenct status.
#Since we want only subdomain with 200 status code, which means working.
#Grep will only fetch subdomain with [200] value from httpx.
#Sed will replace [200] with empty string and give you only link without any code or bracket.
#200url.txt is the fresh output.

echo 'Enter url: '
read url
echo 'Enter your ouput name'
read output

subfinder -d $url | httpx --status-code -no-color | grep "200" | sed 's/[]200[]//g' > $output.txt
