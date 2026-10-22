#!/bin/bash

echo "All args passed to the script:: $@"
echo "Number of args passed to the script:: $#"
echo "first arg passed to the script:: $1"
echo "script name::$0"
echo "All args passed to the script as word:: $*"
sleep 10
echo "Total time executed for this script: $SECONDS"