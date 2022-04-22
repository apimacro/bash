#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 19.04.2022
#
# CONFIG
## load all params: in out status

# START

## load in from csv
## first headers line to , loop

## iteration of headers, from 0 line csv file

## iteration of rows , from 1 to the end csv file

## iteration step save to status

# ./apimacro.sh "1/in.csv" "1/out.csv" "1/status.csv"
# [ -z "$HEADERS" ] && $HEADERS=$1
## split headers
## get second header and execute script

# EXAMPLE
# ./apimacro.sh
# START
if [ "$1" = "" ]; then
  for FILE in */out.csv; do
    line=$(head -n 1 $FILE)
    #echo "$FILE $line"
    #echo PROTOCOL=${URL%%://*}
    NO=${FILE%%/*}
    echo "$NO. $line"
  done
  exit
fi

# EXAMPLE
# ./apimacro.sh 1
# ./apimacro.sh "1/in.csv" "1/out.csv" "1/status.csv"
# START
if [ "$2" = "" ]; then
  IN="$1/in.csv"
  OUT="$1/out.csv"
  STATUS="$1/status.csv"
else
  # ./apimacro.sh "2/in.csv" "2/out.csv" "2/status.csv"
  IN=$1
  OUT=$2
  STATUS=$3
fi
# EXAMPLE
# sh apimacro.sh

# START
## Save
HEADERS=$(head -n 1 $IN)
echo $HEADERS >$OUT
echo $HEADERS

FIRST=${HEADERS%%,*}
CMD=${HEADERS##*,}
full_path=$(realpath $0)
#echo $full_path
dir_path=$(dirname $full_path)
#echo $dir_path


if [[ ! -f "./apimacro/${CMD}.sh" ]]; then
  echo "command '${CMD}' not exist in Path: $dir_path/apimacro/${CMD}.sh"
  exit
fi

i=0

OBJECT_LIST=$(cat $IN)
# sh load/http_status_code.sh https://softreck.com
for object in $OBJECT_LIST; do
  ((i++))
  [ $i = 1 ] && continue
  #url="$object"
  RUNS="$dir_path/apimacro/${CMD}.sh ${object}"
  #echo $RUNS
  RUN=$($RUNS)
  #echo $RUN
  LINE="$object,$RUN"
  echo $LINE
  #[[ $RUN != "000" ]] &&
  echo $LINE >>$OUT
done
