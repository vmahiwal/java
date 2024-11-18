#!/bin/ksh

# Function to display menu options
show_menu() {
    echo "Select an operation:"
    echo "1. Copy (cp)"
    echo "2. Remove (rm)"
    echo "3. Move (mv)"
    echo "4. Change permissions (chmod)"
    echo "5. Change ownership (chown)"
}

# Display menu
show_menu
echo
print -n "Enter your choice (1-5): "
read choice

case $choice in
    1)
        print -n "Enter source file/directory: "
        read source
        print -n "Enter destination file/directory: "
        read destination
        cp "$source" "$destination"
        echo "Copied $source to $destination."
        ;;
    2)
        print -n "Enter file/directory to remove: "
        read target
        rm -i "$target"  # -i option for confirmation
        echo "Removed $target."
        ;;
    3)
        print -n "Enter source file/directory: "
        read source
        print -n "Enter destination file/directory: "
        read destination
        mv "$source" "$destination"
        echo "Moved $source to $destination."
        ;;
    4)
        print -n "Enter permissions (e.g., 755): "
        read permissions
        print -n "Enter file/directory: "
        read target
        chmod "$permissions" "$target"
        echo "Permissions for $target set to $permissions."
        ;;
    5)
        print -n "Enter owner:group (e.g., user:group): "
        read owner_group
        print -n "Enter file/directory: "
        read target
        chown "$owner_group" "$target"
        echo "Ownership of $target set to $owner_group."
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac
