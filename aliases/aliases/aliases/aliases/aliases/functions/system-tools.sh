#!/usr/bin/env bash
# -----------------------------------------
# System Tools — BPT Module
# -----------------------------------------
# A collection of helper functions for
# system monitoring, diagnostics, and
# general Linux administration.
# -----------------------------------------

# --- System Snapshot ---
sys-top() {
    echo "===== CPU ====="
    mpstat 1 1 2>/dev/null || top -bn1 | head -5

    echo
    echo "===== Memory ====="
    free -h

    echo
    echo "===== Disk ====="
    df -h | grep -E '^Filesystem|/dev/'
}

# --- Check which process is using a port ---
find-port() {
    if [ -z "$1" ]; then
        echo "Usage: find-port <port>"
        return 1
    fi

    sudo lsof -i :"$1"
}

# --- Watch logs with error highlighting ---
logwatch() {
    if [ -z "$1" ]; then
        echo "Usage: logwatch <logfile>"
        return 1
    fi

    tail -f "$1" | grep --color=always -E "error|fail|warn|critical|$"
}

# --- Quick disk usage summary ---
disk-summary() {
    echo "Largest directories:"
    du -sh ./* 2>/dev/null | sort -hr | head -20
}

# --- System info wrapper ---
sys-info() {
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime -p)"
    echo "Kernel: $(uname -r)"
    echo "Distro: $(lsb_release -ds 2>/dev/null || cat /etc/os-release)"
}
