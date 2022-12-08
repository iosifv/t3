#!/usr/bin/env bash


PATH_FOR_WWW="/Users/iosif/www"
PATH_FOR_T3="${PATH_FOR_WWW}/github/t3"

# echo $PATH_FOR_T3

for f in $PATH_FOR_T3/platform-agnostic/*; do {
    echo $f
} done
