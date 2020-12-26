#!/usr/bin/bash
cname_search=false
domain=""
while [ -n "$1" ]; do
    case "$1" in
        -c)cname_seach=true;;
        *)domain=$1;;
    esac
shift
done
if [ -z "$domain" ]; then
    read -p "Input domain-name: " domain
fi
while read sub; do
    if host "$sub.$domain"; then
        echo "$sub.$domain"
    fi
    if [ "$cname_seach"=true ]; then
        cname=$(host -t CNAME $sub.$dpmain | grep 'an alias' | awk '{print $NF}')
        if [ -z "$cname" ]; then
            continue
        fi
        if ! host $cname &> /dev/null; then
            echo "$cname not resolve ($sub.$domain)";
        fi
    fi
done < subdomains.txt
