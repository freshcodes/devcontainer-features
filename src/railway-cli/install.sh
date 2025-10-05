#!/usr/bin/env bash
# Railway CLI installation using Railway's official one-liner installer
# Uses: bash <(curl -fsSL cli.new)

set -e

# Get version from feature option, default to latest
RAILWAY_VERSION="${VERSION:-"latest"}"

if [ "$(id -u)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

# Function to check and install packages
check_packages() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* 2>/dev/null | wc -l)" = "0" ]; then
            echo "Running apt-get update..."
            apt-get update -y
        fi
        apt-get -y install --no-install-recommends "$@"
    fi
}

# Ensure we have curl for downloading the installer
check_packages curl ca-certificates

# Prepare environment variables for Railway installer
export BIN_DIR="/usr/local/bin"
export FORCE=1  # Skip confirmation prompts

# Set version if not latest
if [ "${RAILWAY_VERSION}" != "latest" ]; then
    # Railway installer expects version without 'v' prefix
    export RAILWAY_VERSION="${RAILWAY_VERSION#v}"
fi

echo "Installing Railway CLI version: ${RAILWAY_VERSION}"

# Use Railway's official one-liner installation command
bash <(curl -fsSL cli.new)

# Verify installation
if ! command -v railway >/dev/null 2>&1; then
    echo "Railway CLI installation failed"
    exit 1
fi

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Railway CLI installed successfully!"
echo "Version: $(railway --version)"