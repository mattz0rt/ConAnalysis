#!/bin/bash

# Code in this script will be run every time before lldb starts
# This script is optional, only include it if your executable has a complex
# start up proceedure

# Start up code goes here
./$CONANAL_ROOT/concurrency_exploits/mysql-24988/mysql-install/bin/mysqld --user=root &>/dev/null &

# Give MySQL a little time to startup
sleep 3

sysbench --test=oltp --oltp-table-size=1000000 --mysql-db=dbca \
         --mysql-user=root prepare &>/dev/null
