#!/usr/bin/env bash

# environment variable created at install, saved in .zshrc
# PLATFORM_NAME

PATH_FOR_WWW="/Users/iosif/www"
PATH_FOR_T3="${DIR_PATH_FOR_WWW}/github/t3"
PATH_FOR_T3_PLATFORM="${DIR_PATH_FOR_T3}/platform-${PLATFORM_NAME}"

PATH_FOR_BIN="/usr/bin"

# Todo: load all from platform agnostic directory
source $DIR_PATH_FOR_T3/platform-agnostic/*

# Todo: load all from platform specific directory
source $PATH_FOR_T3_PLATFORM/*
