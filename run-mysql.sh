#!/usr/bin/env bash

test -f /tmp/run.conf.d/local-settings && source /tmp/run.conf.d/local-settings

datadir="${mysql_datadir:-/var/db/mysql}"

# Delete old logs that might prevent startup
rm "$datadir/aria_log_control"
rm "$datadir/ib_logfile"*

# Run mysqld without grants to allow easy login without password for root
exec /usr/sbin/mysqld --basedir=/usr --datadir="$datadir" --user=root --skip-grant-tables
