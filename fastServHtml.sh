#!/bin/bash
if [ $# != 1 ]; then 
    echo "Input file dir/name: "
    read filename
    thisdir=$(pwd)
    exfile="$thisdir/$filename"
    echo $exfile
    if [ ! -f $exfile  ]; then
        echo "Not found"
        exit
    else
    while ( nc -l 8000 < $exfile > : ) ; do : ; done
    fi
fi
