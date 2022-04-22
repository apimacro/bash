#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 19.04.2022
#
# EXAMPLE
## create-input-csv.sh "domain,nameservers" "1/domain-list.txt" "1/in.csv"
## create-input-csv.sh "domain,http_status" "1/domain-list.txt" "1/in.csv"

# CONFIG
## load all params: headers [text] + rows [filepath] + output [filepath]
## HEADERS
HEADERS=$1
#[ -z "$HEADERS" ] && $HEADERS=$1
IN=$2
OUT=$3

## Save
echo $HEADERS > $OUT
cat "" >> $OUT
cat $IN >> $OUT
