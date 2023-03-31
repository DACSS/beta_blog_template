#!/bin/bash

# Set IFS to newline
IFS=$'\n'

# Check for any added, modified, or untracked files
files=$(git ls-files --others --modified --exclude-standard)
if [ -n "$(git diff --name-only --cached)" ]; then
  files="$files"$'\n'"$(git diff --name-only --cached)"
fi

# Check for spaces in file names
for file in $files; do
  # If the file name contains a space, reject the commit
  if [[ "$file" =~ [\ ] ]]; then
    printf "Error: File names cannot contain spaces: %s\n" "$file"
    exit 1
  fi
done

# If all checks pass, allow the commit to proceed
exit 0
