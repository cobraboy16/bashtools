#!/bin/bash

dt=$(date)
#[[ $# -lt 3 ]] && echo "$dt Usage: $0 USERNAME PASSWORD DNS_ID";exit;
#
#USERNAME=${1}
#PASSWORD=${2}
#DNS_ID=${3}
#
#echo ${1}

# find your DNS ID here: https://www.hover.com/api/domains/yourdomain.com/dns/

# (replace "yourdomain.com" with your actual domain, and look for the record
# you want to change. The ID looks like: dns1234567)

IP=$(curl "http://v4.ifconfig.co" -s)

echo "$dt Updating ${DNS_ID}"

curl "https://www.hover.com/api/dns/${DNS_ID}" \
     -X PUT            \
     -d "content=${IP}" \
     -s                \
     -b <(curl "https://www.hover.com/api/login" \
               -X POST                   \
               -G                        \
               -d "username=${USERNAME}" \
               -d "password=${PASSWORD}" \
               -s                        \
               -o /dev/null              \
               -c -)

echo

