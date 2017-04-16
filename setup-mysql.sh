#!/bin/sh

# Listen on all IPs
sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Ensure we run as root
sed -i -e "s/^user\s*=\s*mysql/user = root/" /etc/mysql/my.cnf

