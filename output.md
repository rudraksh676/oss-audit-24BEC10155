# Python Audit - Script Execution Outputs

This document contains simulated terminal outputs for the 5 audit scripts.

---

## 1. System Identity Report (`01-identify.sh`)
```bash
rudraksh@ubuntu-server:~/Python$ ./01-identify.sh
================================================================================
                   Python AUDIT - SYSTEM IDENTITY                    
================================================================================
Linux Distribution: Ubuntu 22.04.3 LTS
Kernel Version:     5.15.0-89-generic
Current User:       rudraksh
Home Directory:     /home/rudraksh
System Uptime:      up 2 hours, 45 minutes
Current Date/Time:  Tue Mar 31 2026 14:28:43 GMT+0000 (Coordinated Universal Time)
--------------------------------------------------------------------------------
Message: This system runs on Open Source software, providing freedom to study, change, and distribute.
================================================================================
```

---

## 2. FOSS Package Inspector (`02-packages.sh`)
```bash
rudraksh@ubuntu-server:~/Python$ ./02-packages.sh
================================================================================
                   Python AUDIT - PACKAGE INSPECTOR                 
================================================================================
Status: python3 is INSTALLED on this APT system.
Version: 3.10.12-1ubuntu1
--------------------------------------------------------------------------------
FOSS Philosophy Notes:
 - Python: A versatile language that embodies the principle of readability and community‑driven development.
 - Git: Decentralized version control that empowers collaboration without a central authority.
 - GCC: The GNU Compiler Collection, a cornerstone of free software that enables building portable binaries.
 - Vim: A modal editor that champions efficiency and extensibility through open plugins.
================================================================================
```

---

## 3. Disk and Permission Auditor (`03-auditor.sh`)
```bash
rudraksh@ubuntu-server:~/Python$ ./03-auditor.sh
Directory                               Size       Permissions   Owner     
--------------------------------------------------------------------------------
/etc                                    4.2M       drwxr-xr-x    root      
/var/log                                12M        drwxr-xr-x    syslog    
/usr/lib/python3.10                     68M        drwxr-xr-x    root      
/usr/local/lib/python3.10/site-packages 5.1M       drwxr-xr-x    root      
```

---

## 4. Log File Analyzer (`04-logs.sh`)
```bash
rudraksh@ubuntu-server:~/Python$ ./04-logs.sh /var/log/syslog error
Keyword 'error' found 7 time(s) in /var/log/syslog
--- Last 5 matching entries ---
Mar 31 14:10:02 ubuntu-server python3[1234]: error: failed to open config file
Mar 31 14:12:45 ubuntu-server python3[1238]: error: unexpected EOF while parsing
Mar 31 14:15:09 ubuntu-server python3[1242]: error: module 'requests' not found
Mar 31 14:20:33 ubuntu-server python3[1246]: error: cannot import name 'Path' from 'pathlib'
Mar 31 14:25:17 ubuntu-server python3[1250]: error: division by zero in script.py line 42
```

---

## 5. Open Source Manifesto Generator (`05-manifesto.sh`)
```bash
rudraksh@ubuntu-server:~/Python$ ./05-manifesto.sh
1) What is your favorite Python feature (e.g., list comprehensions)? List comprehensions
2) What open-source contribution goal do you have for the next year? Contribute to the pandas library
3) Share a short inspirational quote that motivates you: Code is like humor. When you have to explain it, it’s bad.
Manifesto appended to rudraksh_manifesto.txt
```
