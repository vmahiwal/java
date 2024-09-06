#!/bin/bash

# Path to the script you want to check
SCRIPT_PATH="$1"

# List of allowed users (space-separated)
ALLOWED_USERS=("user1" "user2" "user3")

# Get the owner of the script
OWNER=$(stat -c '%U' "$SCRIPT_PATH")

# Check if the owner is in the list of allowed users
if [[ " ${ALLOWED_USERS[@]} " =~ " ${OWNER} " ]]; then
    echo "The owner of the script is allowed: $OWNER"
else
    echo "The owner of the script is NOT allowed: $OWNER"
fi
