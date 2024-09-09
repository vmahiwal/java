#!/bin/bash

# Function to check if the script is under /tmp/ or /home/
check_script_location() {
    local script_path=$(realpath "$0")

    if [[ "$script_path" == /tmp/* || "$script_path" == /home/* ]]; then
        return 0  # Return success if path is valid
    else
        return 1  # Return failure if path is invalid
    fi
}

# Call the function and check the result
if check_script_location; then
    echo "The script is running from an allowed directory (/tmp/ or /home/)."
    # Place your script's main logic here
else
    echo "The script is not allowed to run outside /tmp/ or /home/."
    exit 1
fi
