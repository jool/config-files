pathAppend() {
    if ! echo $PATH | egrep -q "(^:)$1($|:)" ; then
        PATH=$PATH:$1
    fi
}

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
pathAppend /opt/local/bin
pathAppend /opt/local/sbin
