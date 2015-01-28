#!/bin/sh

cd "$1"
watch-less -e '.css' &
http-server "$1" -p 8080
