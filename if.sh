#!/bin/bash
aws s3 cp 1.txt s3://milind-bucket-001
if [ $? -eq 0 ]
then 
	echo "ok"
else
	echo "not"
fi

