#!/bin/sh

if ! which node > /dev/null
then
	echo "install node first ... "
	exit 1
fi

if ! which "http-server" > /dev/null
then
	node install http-server -g
fi

if ! which "watch-less" > /dev/null
then
	node install less -g
	node install "watch-less" -g	
fi

cd "$1"
watch-less -e '.css' &
http-server "$1" -p 8080
