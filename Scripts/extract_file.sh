#!/bin/bash

for file in *.tar.gz; do
    directory=$(echo "$file" | sed 's/\.tar\.gz//')
    mkdir -p "$directory" && tar -xf "$file" -C "$directory"
done

