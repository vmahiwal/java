#!/bin/ksh

# Function to display usage
usage() {
    echo "Usage: $0 <application_id> <operation> <parameters>"
    echo "Operations:"
    echo "  copy <source_file> <destination>"
    echo "  chmod <permissions> <file>"
    echo "  chown <owner>:<group> <file>"
    echo "  delete <file>"
    echo "  move <source_file> <destination>"
    exit 1
}

# Check if correct number of arguments are provided
if [ "$#" -lt 3 ]; then
    usage
fi

# Assign arguments to variables
APP_ID="$1"
OPERATION="$2"
shift 2

# Log the operation (you can customize logging as needed)
LOG_FILE="/var/log/file_operations.log"
echo "$(date): Operation '$OPERATION' initiated by Application ID '$APP_ID' with parameters '$*'" >> $LOG_FILE

# Execute the requested operation
case "$OPERATION" in
    copy)
        if [ "$#" -ne 2 ]; then
            echo "Error: 'copy' requires <source_file> and <destination>"
            usage
        fi
        cp "$1" "$2" && echo "File copied successfully." || echo "Error copying file."
        ;;
    chmod)
        if [ "$#" -ne 2 ]; then
            echo "Error: 'chmod' requires <permissions> and <file>"
            usage
        fi
        chmod "$1" "$2" && echo "Permissions changed successfully." || echo "Error changing permissions."
        ;;
    chown)
        if [ "$#" -ne 2 ]; then
            echo "Error: 'chown' requires <owner>:<group> and <file>"
            usage
        fi
        chown "$1" "$2" && echo "Ownership changed successfully." || echo "Error changing ownership."
        ;;
    delete)
        if [ "$#" -ne 1 ]; then
            echo "Error: 'delete' requires <file>"
            usage
        fi
        rm -f "$1" && echo "File deleted successfully." || echo "Error deleting file."
        ;;
    move)
        if [ "$#" -ne 2 ]; then
            echo "Error: 'move' requires <source_file> and <destination>"
            usage
        fi
        mv "$1" "$2" && echo "File moved successfully." || echo "Error moving file."
        ;;
    *)
        echo "Error: Invalid operation '$OPERATION'"
        usage
        ;;
esac

exit 0
