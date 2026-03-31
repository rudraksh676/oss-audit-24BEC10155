#!/bin/bash
# Author: rudraksh (24BEC10155)
# ---------------------------------------------------------------------------
# Script: 01-identify.sh
# Purpose: Extract basic system information and display a friendly Open Source
#          freedom message. This script is useful as the first step in an
#          audit to understand the environment where Python is installed.
# ---------------------------------------------------------------------------

# Retrieve Linux distribution information from /etc/os-release if it exists.
# The file contains key/value pairs; we source it to get the PRETTY_NAME.
if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    distro="$PRETTY_NAME"
else
    distro="Unknown Distribution"
fi

# Kernel version using uname -r (release) which provides the exact kernel build.
kernel=$(uname -r)

# Current logged‑in user (environment variable $USER is reliable for interactive shells).
current_user="$USER"

# Home directory of the current user (environment variable $HOME).
home_dir="$HOME"

# System uptime in a human readable format. "uptime -p" prints "up X days, Y hours...".
# Fallback to plain uptime if -p is not supported.
if uptime -p >/dev/null 2>&1; then
    uptime_info=$(uptime -p)
else
    uptime_info=$(uptime | sed -E 's/.*up //;s/, .*$//')
fi

# Current date and time in the exact format requested by the assignment.
# Using "date" with +"%a %b %d %Y %H:%M:%S %Z%z" approximates the required output.
current_datetime=$(date '+%a %b %d %Y %H:%M:%S %Z%z')

# ---------------------------------------------------------------------------
# Display the collected information inside a nicely formatted banner.
# ---------------------------------------------------------------------------
printf "================================================================================\n"
printf "                   Python AUDIT - SYSTEM IDENTITY                    \n"
printf "================================================================================\n"
printf "Linux Distribution: %s\n" "$distro"
printf "Kernel Version:     %s\n" "$kernel"
printf "Current User:       %s\n" "$current_user"
printf "Home Directory:     %s\n" "$home_dir"
printf "System Uptime:      %s\n" "$uptime_info"
printf "Current Date/Time:  %s\n" "$current_datetime"
printf "--------------------------------------------------------------------------------\n"
printf "Message: This system runs on Open Source software, providing freedom to study, change, and distribute.\n"
printf "================================================================================\n"
