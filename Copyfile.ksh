#!/bin/ksh

# Take input as a single variable
read input

# Split the input into source and destination
source_file=$(echo "$input" | awk '{print $1}')
destination_file=$(echo "$input" | awk '{print $2}')

# Validate input
if [ -z "$source_file" ] || [ -z "$destination_file" ]; then
  echo "Error: Please provide both source and destination paths."
  exit 1
fi

# Check if source file exists
if [ ! -f "$source_file" ]; then
  echo "Error: Source file does not exist."
  exit 1
fi

# Perform the copy
cp "$source_file" "$destination_file"

# Check if copy was successful
if [ $? -eq 0 ]; then
  echo "File copied successfully from $source_file to $destination_file"
else
  echo "Error: Failed to copy file."
  exit 1
fi
