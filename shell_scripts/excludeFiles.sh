##!/bin/bash

# Find modified files that are not in the allowed folders
modified_files=$(git status --porcelain | awk '{print $2}' | grep -vE "^about/|^posts/|^_freeze/")

if [ ! -z "$modified_files" ]; then
    echo "Cannot commit files outside of 'about/', 'posts/', and '_freeze/' folders. Please move the modified files into one of these folders before committing."
    echo "Please exclude the following files:"
    echo "$modified_files"
    echo "\n"
    exit 1
fi;
