# The Open Source Audit: Python

**Student Name:** Rudraksh Dherad <br>
**Registration Number:** 24BEC10155 <br>
**Project Focus:** Python (FOSS Audit)

## Project Overview

This repository contains a suite of 5 Bash shell scripts designed for a university capstone project to audit Python on Linux systems. These scripts automate system identification, package inspection, directory auditing, log analysis, and manifesto generation.

## Script Descriptions

### 1. 01-identify.sh

**Goal:** System Identity Report. Provides a comprehensive overview of the host system, including the Linux distribution, kernel version, current user, home directory, system uptime, and an open-source license message.

### 2. 02-packages.sh

**Goal:** FOSS Package Inspector. Detects if Python is installed, identifies the system's package manager, and provides philosophy notes about common FOSS tools.

### 3. 03-auditor.sh

**Goal:** Disk and Permission Auditor. Loops through critical system and Python-specific directories, reporting their size, ownership, and file permissions.

### 4. 04-logs.sh

**Goal:** Log File Analyzer. Analyzes Python log files by searching for specified keywords, counting occurrences, and displaying the last 5 matching entries.

### 5. 05-manifesto.sh

**Goal:** Open Source Manifesto Generator. An interactive script that crafts a personalized open-source manifesto based on user input and saves it to a text file.

---

## Instructions for Use
```bash
chmod +x *.sh
./01-identify.sh
./02-packages.sh
./03-auditor.sh
./04-logs.sh /var/log/syslog error
./05-manifesto.sh
```
