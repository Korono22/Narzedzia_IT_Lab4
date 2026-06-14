#!/bin/bash
if [ "$1" == "--date" ]; then
    date
elif [ "$1" == "--logs" ]; then
    count=100
    if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
        count=$2
    fi
    for ((i=1; i<=count; i++)); do
        filename="log${i}.txt"
        echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
elif [ "$1" == "--help" ]; then
    echo "Dostepne opcje:"
    echo "--date           - wyswietla aktualna date"
    echo "--logs [liczba]  - tworzy podana liczbe plikow log (domyslnie 100)"
    echo "--help           - wyswietla te pomoc"
fi