#!/usr/bin/env bash

datetime=$1
from_tz=$2
to_tz=$3

if [ $# -ne 3 ]; then
	echo "Please provide three arguments i.e 2023-02-20 05:30:00 CST IST"
	exit;
fi

if [[ $from_tz == 'IST' && $to_tz == 'CST' ]]; then
	TZ=Asia/Calcutta date -d "$datetime" +"%Y-%m-%d %H:%M:%S %Z" | TZ=America/Chicago xargs -I{} date -d "{}" +"%Y-%m-%d %H:%M:%S %Z"
else
	TZ=America/Chicago date -d "$datetime" +"%Y-%m-%d %H:%M:%S %Z" | TZ=Asia/Calcutta xargs -I{} date -d "{}" +"%Y-%m-%d %H:%M:%S %Z"
fi

# example
# convert-timezones.sh '2023-02-20 18:00:00' CST IST
# convert-timezones.sh '2023-02-20 18:00:00' IST CST
