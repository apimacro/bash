#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 19.04.2022
LOGS="logs.txt"
# DOCS
## load in from csv
## first headers line to , loop
## iteration of headers, from 0 line csv file
## iteration of rows , from 1 to the end csv file
## iteration step save to status

# CONFIG
## load all params: in out status

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
echo "" > $LOGS
## split headers
## get second header and execute script

HEADERS=$(head -n 1 $IN)
echo $HEADERS >$OUT
echo $HEADERS

IFS=', ' read -r -a array <<< "$HEADERS"
DATA="${array[0]}"
# echo $DATA
CMD="${array[1]}"
# echo $CMD
FIRST_FILTER_NAME="${array[2]}"
FIRST_FILTER_VALUE="${array[3]}"
# echo $FIRST_FILTER_NAME
# echo $FIRST_FILTER_VALUE
SECOND_FILTER_NAME="${array[4]}"
SECOND_FILTER_VALUE="${array[5]}"
# check if has macro filter

full_path=$(realpath $0)
#echo $full_path
dir_path=$(dirname $full_path)
#echo $dir_path

# check if script exist
SCRIPT=${dir_path}/apimacro/${CMD}.sh
if [[ ! -f "${SCRIPT}" ]]; then
  echo "command '${CMD}' not exist in Path: ${SCRIPT}"
  exit
fi

if [ ! -z "$FIRST_FILTER_NAME" ]; then
  # check if script exist
  FILTER_FIRST=${dir_path}/filter/${FIRST_FILTER_NAME}.sh
  if [[ ! -f "${FILTER_FIRST}" ]]; then
    echo "command '${FIRST_FILTER_NAME}' not exist in Path: ${FILTER_FIRST}"
    exit
  fi
fi

# check if script exist
if [ ! -z "$SECOND_FILTER_NAME" ]; then
  FILTER_SECOND=${dir_path}/filter/${SECOND_FILTER_NAME}.sh
  if [[ ! -f "${FILTER_SECOND}" ]]; then
    echo "command '${SECOND_FILTER_NAME}' not exist in Path: ${FILTER_SECOND}"
    exit
  fi
fi

## Save Results
OBJECT_LIST=$(cat $IN)
i=0
# sh load/http_status_code.sh https://softreck.com
for DATA_IN in $OBJECT_LIST; do
  ((i++))
  [ $i = 1 ] && continue
  #url="$object"
  SCRIPT_CMD="${SCRIPT} ${DATA_IN}"
  #echo $SCRIPT_CMD
  DATA_OUT=$($SCRIPT_CMD)
  # LOGS
  echo ${SCRIPT_CMD} >> $LOGS
  echo ${DATA_OUT} >> $LOGS
  #echo $DATA_OUT
  SCRIPT_OUT="${DATA_IN},${DATA_OUT}"
  echo $SCRIPT_OUT

  if [ ! -z "$FIRST_FILTER_NAME" ]; then
    FILTER_CMD="${FILTER_FIRST} ${FIRST_FILTER_VALUE} ${DATA_OUT}"
    FILTER_OUT=$($FILTER_CMD)
    # LOGS
    echo ${FILTER_CMD} >> $LOGS
    echo ${FILTER_OUT} >> $LOGS
    [ ! -z "$FILTER_OUT" ] && echo $SCRIPT_OUT >> $OUT
  fi
  if [ ! -z "$SECOND_FILTER_NAME" ]; then
    FILTER_CMD="${FILTER_SECOND} ${SECOND_FILTER_NAME} ${DATA_OUT}"
    FILTER_OUT=$($FILTER_CMD)
    # LOGS
    echo ${FILTER_CMD} >> $LOGS
    echo ${FILTER_OUT} >> $LOGS
    [ ! -z "$FILTER_OUT" ] && echo $SCRIPT_OUT >> $OUT
  fi
done
