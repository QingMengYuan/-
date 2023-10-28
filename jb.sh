#!/bin/bash
#This script can send a alert when someone login into vps 
#date:2023-10-28
#name：SSHLoginAlert.sh
#author:mQingYuan

echo "This is a script for ssh login alert"
token=6536771158:AAH8WY1_cdaifYcQlkbIBOTM9xm4J47nGLQ
echo "my token is $token"
id=5285826684
echo "my id is $id"
message=$(hostname && TZ=UTC-8 date && who && w &&last -1 | awk  'BEGIN{ORS="\t"}{print $1,$15}')
echo "send message is $message,begin...."
curl -v "https://api.telegram.org/bot${token}/sendMessage?chat_id=${id}" --data-binary "&text=${message}"
echo "send alert end"