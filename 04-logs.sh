#!/bin/bash
# Author: rudraksh (24BEC10155)
# ---------------------------------------------------------------------------
# Script: 04-logs.sh
# Purpose: Analyze a given log file for a specific keyword. The script counts
#          how many times the keyword appears and then displays the last five
#          matching lines. This is handy for quickly inspecting Python‑related
#          log entries (e.g., errors, warnings).
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Validate arguments.
#   $1 – Path to the log file to be examined.
#   $2 – Keyword to search for (case‑sensitive).
# ---------------------------------------------------------------------------
if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: $0 <log_file> <keyword>"
    echo "Example: $0 /var/log/python3.10.log error"
    exit 1
fi

log_file="$1"
keyword="$2"

# ---------------------------------------------------------------------------
# Suggest a realistic default log path for Python applications.
# ---------------------------------------------------------------------------
# NOTE: Many Python services log to /var/log/<service>.log. Adjust as needed.
# Example: /var/log/python3.10.log

# ---------------------------------------------------------------------------
# Verify that the log file exists and is readable.
# ---------------------------------------------------------------------------
if [[ ! -r "$log_file" ]]; then
    echo "Error: Cannot read log file '$log_file'."
    exit 2
fi

# ---------------------------------------------------------------------------
# Count occurrences of the keyword using a while‑read loop. This approach reads
# the file line‑by‑line, which is memory‑efficient for large logs.
# ---------------------------------------------------------------------------
count=0
while IFS= read -r line; do
    if [[ "$line" == *"$keyword"* ]]; then
        ((count++))
    fi
done < "$log_file"

# ---------------------------------------------------------------------------
# Display the total count.
# ---------------------------------------------------------------------------
printf "Keyword '%s' found %d time(s) in %s\n" "$keyword" "$count" "$log_file"

# ---------------------------------------------------------------------------
# Show the last five matching lines using grep and tail. Grep extracts all
# matching lines; tail then limits the output to the final five entries.
# ---------------------------------------------------------------------------
if (( count > 0 )); then
    echo "--- Last 5 matching entries ---"
    grep -- "$keyword" "$log_file" | tail -n 5
else
    echo "No matching entries to display."
fi
