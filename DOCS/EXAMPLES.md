
## EXAMPLES [<span style='font-size:20px;'>&#x270D;</span>](https://github.com/apimacro/bash/edit/main/DOCS/EXAMPLES.md)

### Automatyczne generowanie na podstawie pliku CSV

wszystkie dane są dostepne poprzez mikrousluge
lub na serwerze FTP

### START

prepare input data
+ 1/domain-list.txt

```txt
example1.com
example2.com
example3.com
```

run script to create the input file
+ 1/in.csv

```bash
./create-input-csv.sh "domain,https_status" "1/domain-list.txt" "1/in.csv"
```

output of script:
+ 1/in.csv

```csv
domain,http_status_code
example1.com
example2.com
example3.com
```

#### 1. Load status of domains

```bash
./load.sh "1/in.csv" "1/out.csv" "1/status.csv"
```

dane wejsciowe:
+ 1/in.csv

```csv
domain,http_status_code
example1.com
example2.com
example3.com
```

status wykonywania, aktualizowany po każdej iteracji:
+ 1/status.csv

```csv
domain,http_status_code
example1.com,done
example2.com,warning
example3.com,
```


Dane wyjściowe:
+ 1/out.csv

```csv
domain,http_status_code
example1.com,200
example2.com,500
example3.com,301
```

### 2. Load nameservers for domain list

Another example with checking nameservers

Dane wejsciowe:
+ 2/in.csv

```csv
domain,nameservers
example1.com
example2.com
example3.com
```

Dane wyjsciowe:
+ 2/out.csv

```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com 
example2.com,ns1.com,ns2.com,ns3.com
example3.com,ns1.com,ns2.com,ns3.com
```


### 3. Load nameservers for domain list

Another example with making screenshots

Dane wejsciowe:
+ 3/in.csv

```csv
domain,nameservers
example1.com
example2.com
example3.com
```

Dane wyjsciowe:
+ 3/out.csv

```csv
domain,nameservers
example1.com,/home/user/example1.com.png 
example2.com,/home/user/example1.com.png
example3.com,/home/user/example1.com.png
```

### 4. Compare nameservers for domain list

Dane wyjsciowe mogą posłużyć do sprawdzenia stanu:

Dane wejsciowe:
+ 4/in.csv

```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com
example2.com,ns1.com,ns2.com,ns3.com
example3.com,ns1.com,ns2.com,ns3.com
```


Dane wyjsciowe:
+ 4/out.csv

```csv
domain,nameservers
example1.com,ns1.com,ns2.com,ns3.com 
example2.com,ns1.com,ns2.com,ns3.com
example3.com,ns1.com,ns2.com,ns3.com
```

### Filtering

now the filtering is possible with external bash script:
Headers in CSV:

1. data column
2. bash script commmand name
3. First filter name
4. First filter value
5. Second filter name
6. Second filter value

Examples

    http_status_code,equal,200
    http_status_code,not_equal,200
    http_status_code,more_than,200,less_than,300
    http_status_code,remove-duplicates

### API with auth

3/in.csv
```bash
./apimacro.sh 9
```