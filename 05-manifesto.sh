#!/bin/bash
# Author: rudraksh (24BEC10155)
# ---------------------------------------------------------------------------
# Script: 05-manifesto.sh
# Purpose: Interactively collect three pieces of information from the user,
#          compose a short manifesto paragraph that incorporates the answers,
#          and append it to a text file named after the current user.
# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
# Prompt the user for their favorite Python feature, a personal open‑source
# goal, and a short inspirational quote. The -r flag with read prevents backslash
# interpretation, allowing free‑form input.
# ---------------------------------------------------------------------------
read -r -p "1) What is your favorite Python feature (e.g., list comprehensions)? " fav_feature
read -r -p "2) What open‑source contribution goal do you have for the next year? " oss_goal
read -r -p "3) Share a short inspirational quote that motivates you: " quote

# ---------------------------------------------------------------------------
# Build the manifesto paragraph. Variables are expanded inside double quotes.
# ---------------------------------------------------------------------------
manifesto="As a passionate developer, I love Python because $fav_feature. My goal for the upcoming year is $oss_goal. I live by the words: \"$quote\". Together, we can keep the spirit of free software thriving."

# ---------------------------------------------------------------------------
# Determine the output filename. Using the current user's login name ensures the
# file is unique per participant.
# ---------------------------------------------------------------------------
output_file="${USER}_manifesto.txt"

# Append the paragraph to the file, creating it if it does not exist.
printf "%s\n\n" "$manifesto" >> "$output_file"

# Inform the user where the manifesto was saved.
printf "Manifesto appended to %s\n" "$output_file"
