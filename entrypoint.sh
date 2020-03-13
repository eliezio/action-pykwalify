#!/bin/bash

set -e

echo "====================================="
echo "= Linting YAML files with pyKwalify ="
echo "====================================="

options=(--schema-file "$INPUT_SCHEMA")

if [[ "$INPUT_STRICT" == "true" ]]; then
    options+=(--strict-rule-validation)
fi

# Enable globstar so ** globs recursively
shopt -s globstar
# Use the current directory by default
for file in ${INPUT_FILES:-.}; do
    echo " INFO - linting $file"
    pykwalify "${options[@]}" --data-file $file
done
