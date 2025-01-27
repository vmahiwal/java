#!/bin/ksh

# Specify the target JDK versions and their RPM files
TARGET_VERSIONS=("11.0.23" "17.0.12")
declare -A JDK_RPMS
JDK_RPMS["11.0.23"]="/path/to/jdk-11.0.23_linux-x64_bin.rpm"
JDK_RPMS["17.0.12"]="/path/to/jdk-17.0.12_linux-x64_bin.rpm"

# Function to check if a specific Oracle JDK version is installed
check_jdk_version() {
  local target_version="$1"
  if command -v java >/dev/null 2>&1; then
    INSTALLED_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
    if [ "$INSTALLED_VERSION" = "$target_version" ]; then
      echo "Oracle JDK version $target_version is already installed."
      return 0
    fi
  fi
  return 1
}

# Function to install a specific Oracle JDK version
install_jdk() {
  local version="$1"
  local rpm_file="${JDK_RPMS[$version]}"

  if [ ! -f "$rpm_file" ]; then
    echo "RPM file for JDK version $version not found: $rpm_file"
    exit 1
  fi

  echo "Installing Oracle JDK version $version from $rpm_file..."
  sudo rpm -ivh "$rpm_file"

  # Verify installation
  if check_jdk_version "$version"; then
    echo "Oracle JDK version $version installed successfully."
  else
    echo "Failed to install Oracle JDK version $version."
    exit 1
  fi
}

# Main logic
for version in "${TARGET_VERSIONS[@]}"; do
  if ! check_jdk_version "$version"; then
    install_jdk "$version"
  fi
done
