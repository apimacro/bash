#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 19.04.2022
#
# EXAMPLES:
# ./csv-to-txt-filter.sh "domain" "2/out.csv" "1/in.txt" ".pl"
# ./merge-files-from-path.sh "/media/tom/projects/apibash/whois/registrar_domain" "domain-list.txt" "txt"
#
# CONFIG
FOLDER=$1
FILE_OUT=$2
EXTENSION=$3
# ${FOLDER}/*.${EXTENSION}
#
# START
