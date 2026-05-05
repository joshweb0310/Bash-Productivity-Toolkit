#!/usr/bin/env bash
# -----------------------------------------
# Git Tools — BPT Module
# -----------------------------------------
# Helper functions for Git workflows:
# cleanup, branch management, diffs,
# logs, and stash utilities.
# -----------------------------------------

# --- Undo last commit but keep changes ---
git-undo() {
    echo "Soft resetting HEAD~1..."
    git reset --soft HEAD~1
}

# --- Hard reset to remote (dangerous) ---
git-reset-hard() {
    echo "Resetting to origin/$1..."
    if [ -z "$1" ]; then
        echo "Usage: git-reset-hard <branch>"
        return 1
    fi

    git fetch origin
    git reset --hard origin/"$1"
}

# --- Delete merged branches ---
git-clean-branches() {
    echo "Deleting merged branches..."
    git branch --merged | grep -v "\*" | xargs -r git branch -d
}

# --- Show branches sorted by last commit ---
git-branches-by-date() {
    git for-each-ref --sort=-committerdate refs/heads/ \
        --format='%(color:yellow)%(refname:short)%(color:reset) - %(committerdate:relative)'
}

# --- Pretty diff ---
git-pretty-diff() {
    git diff --color | less -R
}

# --- Stash with message ---
git-stash-msg() {
    if [ -z "$1" ]; then
        echo "Usage: git-stash-msg <message>"
        return 1
    fi

    git stash push -m "$1"
}

# --- Show stash list with formatting ---
git-stash-list() {
    git stash list --pretty=format:"%C(yellow)%h%Creset - %Cgreen%cr%Creset - %s"
}
