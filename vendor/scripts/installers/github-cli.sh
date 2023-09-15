#!/bin/bash -e
################################################################################
##  File:  github-cli.sh
##  Desc:  Installs GitHub CLI
##         Must be run as non-root user after homebrew
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/install.sh

# Install GitHub CLI
architecture=$(uname -m)

if [ "$architecture" == "x86_64" ]; then
    echo "Running code for AMD64 (x86_64)"
    downloadUrl=$(get_github_package_download_url "cli/cli" "contains(\"linux\") and contains(\"amd64\") and contains(\".deb\")")
    download_with_retries $downloadUrl "/tmp"
    apt install /tmp/gh_*_linux_amd64.deb
elif [ "$architecture" == "aarch64" ]; then
    echo "Running code for ARM64 (aarch64)"
    downloadUrl=$(get_github_package_download_url "cli/cli" "contains(\"linux\") and contains(\"arm64\") and contains(\".deb\")")
    download_with_retries $downloadUrl "/tmp"
    apt install /tmp/gh_*_linux_arm64.deb
else
    echo "Unsupported architecture: $architecture"
    exit 1
fi

invoke_tests "CLI.Tools" "GitHub CLI"
