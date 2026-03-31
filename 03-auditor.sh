#!/bin/bash
# Author: rudraksh (24BEC10155)
# ---------------------------------------------------------------------------
# Script: 03-auditor.sh
# Purpose: Audit a set of critical system directories plus two Python‑specific
#          locations. For each existing directory the script reports its size,
#          permission bits, and owning user in aligned columns.
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Define the base array of directories to audit.
# ---------------------------------------------------------------------------
DIRS=(
    "/etc"
    "/var/log"
)

# Dynamically append two Python‑related paths. These paths are common on many
# modern distributions; adjust as needed for your environment.
PYTHON_MAJOR=$(python3 -c "import sys; print(sys.version_info.major)")
PYTHON_MINOR=$(python3 -c "import sys; print(sys.version_info.minor)")
PYTHON_VER="${PYTHON_MAJOR}.${PYTHON_MINOR}"
DIRS+=( "/usr/lib/python${PYTHON_VER}" "/usr/local/lib/python${PYTHON_VER}/site-packages" )

# ---------------------------------------------------------------------------
# Header for the tabular output. Using printf ensures proper alignment.
# ---------------------------------------------------------------------------
printf "%-40s %-10s %-12s %-10s\n" "Directory" "Size" "Permissions" "Owner"
printf "%.0s-" {1..80}
printf "\n"

# ---------------------------------------------------------------------------
# Loop through each directory, verify existence, and extract required data.
# ---------------------------------------------------------------------------
for dir in "${DIRS[@]}"; do
    if [[ -d "$dir" ]]; then
        # Size in human‑readable form (e.g., 12K, 3.4M). du -sh prints a single line.
        size=$(du -sh "$dir" 2>/dev/null | cut -f1)
        # Permissions in symbolic form (e.g., drwxr-xr-x) via stat.
        perms=$(stat -c "%A" "$dir" 2>/dev/null)
        # Owner username via stat.
        owner=$(stat -c "%U" "$dir" 2>/dev/null)
        printf "%-40s %-10s %-12s %-10s\n" "$dir" "$size" "$perms" "$owner"
    else
        # If the directory does not exist, note it in the Owner column.
        printf "%-40s %-10s %-12s %-10s\n" "$dir" "N/A" "N/A" "Missing"
    fi
done
