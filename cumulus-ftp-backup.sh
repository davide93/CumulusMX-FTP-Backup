#!/bin/sh

########################
# EDIT BELOW           #
########################

# FTP Login
USERNAME="username"
PASSWORD="password"
SERVER="host"
PORT="21"

# Local directory to backup
DIR="/home/CumulusMX/data"

# Remote FTP to place backup
REMOTEDIR="./"

# Archive name to generate without extension (.tar.gz by default)
FILE="CumulusMXBackup"

##############################
# STOP!    DO NOT EDIT       #
##############################

FILE=$FILE.tar.gz"
tar -czvf ./$FILE $DIR
echo 'Tar OK - Now uploading'

ftp -n -i $SERVER $PORT<<EOF
user $USERNAME $PASSWORD
binary
put $FILE $REMOTEDIR/$FILE
quit
EOF

remove_backup() {
    rm -f ./$FILE
    echo 'Local backup removed - Fine'
}

echo 'Backup OK'
remove_backup