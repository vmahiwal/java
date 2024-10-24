#!/bin/ksh

# Define the list of directories you want to scan
DIR_LIST=(
    "/path/to/dir1"
    "/path/to/dir2"
    "/path/to/dir3"
)

# Define the report file with the current date
REPORT_FILE="recursive_777_report_$(date +%Y%m%d).txt"

# Initialize the report file
echo "Recursive Scan Report - Files and Directories with 777 Permissions" > "$REPORT_FILE"
echo "Date: $(date)" >> "$REPORT_FILE"
echo "============================================" >> "$REPORT_FILE"

# Loop through each directory in the list
for DIR in "${DIR_LIST[@]}"; do
    echo "Scanning directory recursively: $DIR" >> "$REPORT_FILE"

    # Check if the directory exists
    if [ -d "$DIR" ]; then
        # Recursively find files and directories with 777 permissions and append to report
        find "$DIR" -type f -perm 777 -o -type d -perm 777 -exec ls -ld {} \; >> "$REPORT_FILE"
        # If no files/folders are found, log that information
        if [ $(find "$DIR" -type f -perm 777 -o -type d -perm 777 | wc -l) -eq 0 ]; then
            echo "No files or directories with 777 permissions found in $DIR" >> "$REPORT_FILE"
        fi
    else
        echo "Directory $DIR does not exist." >> "$REPORT_FILE"
    fi

    echo "--------------------------------------------" >> "$REPORT_FILE"
done

echo "Recursive scan complete. Report saved as $REPORT_FILE."
