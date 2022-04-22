#!/bin/bash
# EXAMPLE
## ./load/http_status_code.sh "https://autoinwigilacja.pl"
# CONFIG
URLS="$1"
#echo $URLS
# START
HTTP_STATUS_CODE=$(curl -L -o /dev/null -s -w "%{http_code}\n" "$URLS")
sleep 1

if [ $HTTP_STATUS_CODE = "301" ];
then
  URLS=$( curl -Ls -w "%{url_effective}" -o /dev/null "$URLS")
  #echo $URL
  sleep 2
  HTTP_STATUS_CODE=$(curl -L -o /dev/null -s -w "%{http_code}\n" "$URLS")
  sleep 1
fi

if [ $HTTP_STATUS_CODE = "000" ];
then
    #echo "1 $URLS"
    URLS=${URLS/https/http}
    #echo "2 $URLS "
    HTTP_STATUS_CODE=$(curl -L -o /dev/null -s -w "%{http_code}\n" "$URLS")
fi

sleep 1
echo $HTTP_STATUS_CODE

#HTTP_STATUS_CODE=$(curl -L -o /dev/null -s -w "%{http_code}\n" "http://$1")
