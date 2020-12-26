#!/bin/bash
while [ -n "$1" ]
do
    case "$1" in
        -a) echo "Flag A!";;
        -b) echo "Flag B!";;
        --) shift
            break;;
        *) echo "Another";;
    esac
    shift
done
count=1
for param in $@
do
    echo "Parametr №$count: $param"
    count=$(( $count + 1 ))
done
