#!/bin/bash
if [ "$1" == "--date" ]; then
    date
elif [ "$1" == "--logs" ]; then
    count=100
    if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
        count=$2
    fi

    for ((i=1; i<=count; i++))
    do
        filename="log${i}.txt"
        echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
fi