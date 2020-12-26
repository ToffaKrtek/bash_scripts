#!/bin/bash
echo "\nGenerator exec\n"
echo "Lenght:.."
read pass_lenght
for p in $(seq 1); do
    openssl rand -base64 48 | cut -c1-$pass_lenght
done >> result
cat result
