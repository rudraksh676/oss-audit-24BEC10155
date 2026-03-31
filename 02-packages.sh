#!/bin/bash
# Author: rudraksh (24BEC10155)
# ---------------------------------------------------------------------------
# Script: 02-packages.sh
# Purpose: Detect the host's package manager, verify Python installation, report
#          its exact version, and display short philosophy notes for four FOSS
#          tools (including Python). This helps auditors quickly gauge the
#          software stack and its ideological context.
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Function: detect_pkg_manager
# Detects the package manager based on common binaries and sets two variables:
#   PKG_MANAGER – the command used to query packages (e.g., apt, dnf, yum, pacman)
#   PKG_QUERY   – the appropriate query flag to list package information.
# ---------------------------------------------------------------------------
detect_pkg_manager() {
    if command -v apt-get >/dev/null 2>&1; then
        PKG_MANAGER="apt"
        PKG_QUERY="list --installed"
    elif command -v dnf >/dev/null 2>&1; then
        PKG_MANAGER="dnf"
        PKG_QUERY="list installed"
    elif command -v yum >/dev/null 2>&1; then
        PKG_MANAGER="yum"
        PKG_QUERY="list installed"
    elif command -v pacman >/dev/null 2>&1; then
        PKG_MANAGER="pacman"
        PKG_QUERY="-Qs"
    else
        PKG_MANAGER="unknown"
        PKG_QUERY=""
    fi
}

# ---------------------------------------------------------------------------
# Detect the package manager for the current system.
# ---------------------------------------------------------------------------
detect_pkg_manager

# Determine the appropriate package name for Python based on the distro.
# Most modern distros ship Python 3 under the name "python3".
PYTHON_PKG="python3"

# ---------------------------------------------------------------------------
# Function: check_python_installation
# Uses the previously detected package manager to verify if the Python package
# is installed and extracts its version.
# ---------------------------------------------------------------------------
check_python_installation() {
    case "$PKG_MANAGER" in
        apt)
            # "dpkg -s" provides a stable way to query package status and version.
            if dpkg -s "$PYTHON_PKG" >/dev/null 2>&1; then
                status="INSTALLED"
                version=$(dpkg -s "$PYTHON_PKG" | awk -F ': ' '/Version/ {print $2}')
            else
                status="NOT INSTALLED"
                version="N/A"
            fi
            ;;
        dnf|yum)
            if rpm -q "$PYTHON_PKG" >/dev/null 2>&1; then
                status="INSTALLED"
                version=$(rpm -q --queryformat "%{VERSION}-%{RELEASE}\n" "$PYTHON_PKG")
            else
                status="NOT INSTALLED"
                version="N/A"
            fi
            ;;
        pacman)
            if pacman -Qi "$PYTHON_PKG" >/dev/null 2>&1; then
                status="INSTALLED"
                version=$(pacman -Qi "$PYTHON_PKG" | awk -F ': ' '/Version/ {print $2}')
            else
                status="NOT INSTALLED"
                version="N/A"
            fi
            ;;
        *)
            status="UNKNOWN"
            version="N/A"
            ;;
    esac
}

# ---------------------------------------------------------------------------
# Execute the check and store results.
# ---------------------------------------------------------------------------
check_python_installation

# ---------------------------------------------------------------------------
# Output banner and results.
# ---------------------------------------------------------------------------
printf "================================================================================\n"
printf "                   Python AUDIT - PACKAGE INSPECTOR                 \n"
printf "================================================================================\n"
printf "Status: %s is %s on this %s system.\n" "$PYTHON_PKG" "$status" "${PKG_MANAGER^^}"
printf "Version: %s\n" "$version"
printf "--------------------------------------------------------------------------------\n"
printf "FOSS Philosophy Notes:\n"

# ---------------------------------------------------------------------------
# Case statement to print short philosophy notes for four tools.
# ---------------------------------------------------------------------------
case "$PYTHON_PKG" in
    python3)
        echo " - Python: A versatile language that embodies the principle of readability and community‑driven development.";;
    *)
        echo " - Python: (note unavailable)";;
esac

# Additional tools – these are hard‑coded for the purpose of the audit.
cat <<'EOF'
 - Git: Decentralized version control that empowers collaboration without a central authority.
 - GCC: The GNU Compiler Collection, a cornerstone of free software that enables building portable binaries.
 - Vim: A modal editor that champions efficiency and extensibility through open plugins.
EOF

printf "================================================================================\n"
