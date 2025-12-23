#!/bin/bash

echo "stated with unit 3 defensive code that change the world according to me but who know i will save the world or not make sure you will live my love "

# 1. cut command that cut someting that i dont know we know now how it working on shelll 
#
echo "[+]  using cut to extract username from /etc/passwd"
cut -d -f1 /etc/passwd >  user.txt


# 2. file - identifying file type in /bin/ directory 

for f in /bin/*; do 
	file "$f" >>  file_types.txt
done

# 3. head preview large log file safely 

echo "[+]  preview  first 10 lines of syslog"
head -n 10  /var/log/syslog >  syslog_preview.txt

echo "linux data collection completed"
