#!/bin/bash
if [ "$1" == "--date" ]; then
    date
elif [ "$1" == "--logs" ] && [ -z "$2" ]; then
    for i in {1..100}
    do
        filename="log${i}.txt"
        echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
fi