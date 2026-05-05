#!/usr/bin/env bash
# -----------------------------------------
# Utility Tools — BPT Module
# -----------------------------------------
# General-purpose helper functions:
# timers, extractors, random strings,
# UUIDs, and safe file operations.
# -----------------------------------------

# --- Simple timer ---
timer() {
    if [ -z "$1" ]; then
        echo "Usage: timer <seconds>"
        return 1
    fi

    secs=$1
    while [ $secs -gt 0 ]; do
        echo -ne "Time remaining: $secs\033[0K\r"
        sleep 1
        : $((secs--))
    done
    echo -e "\nDone."
}

# --- Extract archives of many types ---
extract() {
    if [ -z "$1" ]; then
        echo "Usage: extract <file>"
        return 1
    fi

    case "$1" in
        *.tar.bz2)   tar xjf "$1"   ;;
        *.tar.gz)    tar xzf "$1"   ;;
        *.bz2)       bunzip2 "$1"   ;;
        *.rar)       unrar x "$1"   ;;
        *.gz)        gunzip "$1"    ;;
        *.tar)       tar xf "$1"    ;;
        *.tbz2)      tar xjf "$1"   ;;
        *.tgz)       tar xzf "$1"   ;;
        *.zip)       unzip "$1"     ;;
        *.7z)        7z x "$1"      ;;
        *)           echo "Unknown archive format: $1" ;;
    esac
}

# --- Generate random string ---
randstr() {
    length=${1:-16}
    tr -dc A-Za-z0-9 </dev/urandom | head -c "$length"
    echo
}

# --- Generate UUID ---
uuid() {
    cat /proc/sys/kernel/random/uuid
}

# --- Safe rename (prevents overwriting) ---
safe-rename() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: safe-rename <old> <new>"
        return 1
    fi

    if [ -e "$2" ]; then
        echo "Error: '$2' already exists. Rename aborted."
        return 1
    fi

    mv "$1" "$2"
    echo "Renamed '$1' → '$2'"
}
