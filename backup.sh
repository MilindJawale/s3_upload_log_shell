#!/bin/bash
src=/home/shell/log                   #log directory
dest=/home/shell/backups              #dest directory   
time_stamp=$(date +"%y-%m-%d-%H-%M-%S")
file=$dest/$time_stamp.tgz             
tar -czf $file --absolute-names $src
echo "backup is created at $time_stamp"
file1=$(ls -lrt  /home/shell/backups | tail -n1 | awk '{print$9}')  #latest backup file
cp $dest/$file1 /home/ec2-user
aws s3 cp /home/ec2-user/$file1 s3://milind-bucket-001
if [ $? -eq 0 ]
then
	echo " log is uploded to bucket $time_stamp"
rm /home/ec2-user/$file1
fi
