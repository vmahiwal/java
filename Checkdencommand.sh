#!/bin/bash

# Path to the script you want to check
SCRIPT_PATH="$1"

# List of dangerous commands (you can extend this list)
DANGEROUS_COMMANDS=("rm -rf" "mkfs" "dd" "shutdown" "reboot" ":(){ :|:& };:")

# Check if file exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "File does not exist."
    exit 1
fi

# Function to check for dangerous commands in the script
check_for_dangerous_commands() {
    local found_dangerous=false
    for command in "${DANGEROUS_COMMANDS[@]}"; do
        if grep -q "$command" "$SCRIPT_PATH"; then
            echo "Warning: Dangerous command '$command' found in script!"
            found_dangerous=true
        fi
    done

    if [ "$found_dangerous" = false ]; then
        echo "No dangerous commands found."
    fi
}

# Run the check
check_for_dangerous_commands
