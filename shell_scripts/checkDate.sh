#!/bin/bash

current_date=$(date "+%m/%d/%Y")

# Find tracked files in the posts directory with the .qmd extension
files=$(git ls-files --others --exclude-standard -- ./posts/*.qmd)

for file in $files; do
  if ! grep -q -E "date:\s+\"$current_date\"" "$file"; then
    echo "File $file does not have the correct date. Make sure you enter today's date in format mm/dd/yyyy" >&2; exit 1;
  fi;
done;

exit 0
