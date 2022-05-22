
## START [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apimacro/bash/edit/main/DOCS/START.md)


# SCRIPTS

./load.sh "2/in.csv" "2/out.csv" "2/status.csv"
cat 2/out.csv | grep 000

cat 2/out.csv | grep 000 > 2/error.txt
```bash
./csv-to-txt-filter.sh "domain" "2/out.csv" "1/in.txt" ".pl"
./csv-to-txt-filter.sh "domain" "2/out.csv" "1/in.txt" ".de"
```

split csv to txt
```bash
./csv-to-txt.sh "domain" "2/out.csv" "1/in.txt"
```

Merge without duplicate columns
```bash
./merge-csv.sh "2/out.csv" "3/out.txt" "4/out.txt"
```


## Typy kommend infrash

+ compare ( value from in and current infrastructure )
+ load ( from infrastructure )

## compare

values from in and current infrastructure

```bash
./compare.sh
```


## load

load values from infrastructure

```bash
./load.sh
```

## Start using apiMacro

List of projects
```bash
./apimacro.sh
```

Run macro for 1/in.csv
```bash
./apimacro.sh 1
```

The same, with separated details, run macro for 1/in.csv
```bash
./apimacro.sh "1/in.csv" "1/out.csv" "1/status.csv"
```

filtering
3/in.csv
```bash
./apimacro.sh 3
```
