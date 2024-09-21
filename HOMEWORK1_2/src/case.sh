#!/bin/bash

set -x #For debug purpose.

echo "Name of script: $0"

case $1 in
	start)
		echo "Starting"
	;;
	stop)
		echo "Stoping"
	;;
	*)
		echo "Default"
	;;
esac
