#!/bin/bash

set -e

echo "====================================="
echo "= Linting YAML files with pyKwalify ="
echo "====================================="

case "$INPUT_SCHEMA" in
    http://* | https://* )
        wget -O /tmp/schema.yaml "$INPUT_SCHEMA"
        INPUT_SCHEMA=/tmp/schema.yaml
        ;;
esac

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
