#!/usr/bin/env bash

# environment variable created at install, saved in .zshrc
# PLATFORM_NAME

PATH_FOR_WWW="/Users/iosif/www"
PATH_FOR_T3="${PATH_FOR_WWW}/github/t3"
PATH_FOR_T3_PLATFORM="${PATH_FOR_T3}/platform-${PLATFORM_NAME}"

PATH_FOR_BIN="/usr/bin"

# Load all from platform agnostic directory
for f in $PATH_FOR_T3/platform-agnostic/*; do {
    source $f
} done

# Load all from platform specific directory
for f in $PATH_FOR_T3/platform-$PLATFORM_NAME/*; do {
    source $f
} done

