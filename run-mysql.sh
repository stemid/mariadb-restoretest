#!/bin/sh

# Delete old logs that might prevent startup
rm /var/db/mysql/aria_log_control
rm /var/db/mysql/ib_logfile*

# Run mysqld without grants to allow easy login without password for root
exec /usr/sbin/mysqld --basedir=/usr --datadir=/var/db/mysql --user=root --skip-grant-tables
