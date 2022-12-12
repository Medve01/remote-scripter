#!/bin/bash

# Check if the required number of arguments was provided
if [ $# -ne 3 ]; then
  echo "Usage: $0 server_identifier directory filename"
  exit 1
fi

# Assign the arguments to variables
server=$1
directory=$2
filename=$3

# Copy the directory to the server
scp -r $directory $server:/tmp/

# Execute the file on the server
ssh $server "bash /tmp/$directory/$filename"

# Capture the output of the command
output=$(ssh $server "bash /tmp/$directory/$filename")

# Print the output
echo "$output"

# Remove the directory from the server
ssh $server "rm -r /tmp/$directory"

