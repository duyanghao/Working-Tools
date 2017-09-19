## Run

```bash
bash judge_spark_hang.sh date_file time_period
``` 

* we can get `date_file` by executing the command:`cat file | awk '{if($0~"2017-09-") print}' | awk '{print $1,$2}' > date_file`
* `time_period` is the threshold value(s) that you want to check(eg:120)
