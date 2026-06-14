#!/bin/bash
if [ "$1" == "--date" ] || [ "$1" == "-d" ]; then
    date
elif [ "$1" == "--logs" ] || [ "$1" == "-l" ]; then
    count=100
    if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
        count=$2
    fi
    for ((i=1; i<=count; i++)); do
        filename="log${i}.txt"
        echo -e "Nazwa pliku: $filename\nNazwa skryptu: $0\nData: $(date)" > $filename
    done
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Dostepne opcje:"
    echo "--date, -d           - wyswietla aktualna date"
    echo "--logs, -l [liczba]  - tworzy podana liczbe plikow log (domyslnie 100)"
    echo "--help, -h           - wyswietla te pomoc"
    echo "--init               - klonuje repozytorium i dodaje je do PATH"
    echo "--error, -e [liczba] - tworzy podana liczbe plikow z bledami (domyslnie 100)"
elif [ "$1" == "--init" ]; then
    git clone <URL_TWOJEGO_REPOZYTORIUM> .
    export PATH="$PATH:$(pwd)"
    echo "Repozytorium sklonowane, dodano $(pwd) do PATH."
elif [ "$1" == "--error" ] || [ "$1" == "-e" ]; then
    count=100
    if [ -n "$2" ] && [[ "$2" =~ ^[0-9]+$ ]]; then
        count=$2
    fi
    for ((i=1; i<=count; i++)); do
        mkdir -p "error${i}"
        filename="error${i}/error${i}.txt"
        echo -e "Blad nr: $i\nSkrypt: $0\nData: $(date)" > $filename
    done
fi