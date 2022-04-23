![3/cover.png](http://logo.apimacro.com/3/cover.png)

# [bash.apimacro.com](https://bash.apimacro.com/)

+ [www.apimacro.com](https://www.apimacro.com/)
+ [logo.apimacro.com](https://logo.apimacro.com/)
+ [docs.apimacro.com](https://examples.apimacro.com/)
+ [examples.apimacro.com](https://examples.apimacro.com/)

bash macro builder based on CSV data format and Command with bash scripts


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

# Filtering

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


# TODO
+ Clear input data from CSV: 
```  
" 
[space]
```


will be good use some standrds such xpath or another to create more advanced examples
format for filtering

    http_status_code(http_status_code!=200 && http_status_code!=300)

---

+ [edit](https://github.com/apimacro/examples/edit/main/README.md)
