s unit shifts focus from general administration to **Defensive Security Operations (Blue Teaming)**. In a security exam, the goal is to show how you can use the shell to detect intruders, analyze logs, and monitor system integrity.

---

## **1. Data Collection & System Information**

Security analysts must gather "artifacts" to understand what happened on a system.

### **Linux Data Collection**

* **`cut`**: Used to extract specific columns from a file.
* *Ex:* `cut -d':' -f1 /etc/passwd` (Extracts all usernames from the password file).


* **`file`**: Determines the file type (e.g., is it a real image or a hidden executable?).
* **`head`**: Views the first few lines of a file to check for suspicious headers.

### **Windows Data Collection (via PowerShell/CMD)**

* **`reg`**: The command-line tool for interacting with the Windows Registry (useful for finding persistence mechanisms like "Run" keys).
* **`wevtutil`**: The Windows Event Utility. It allows you to query system, security, and application logs via the CLI.
* *Ex:* `wevtutil qe Security /q:"*[System[(EventID=4624)]]"` (Queries successful logins).



---

## **2. Gathering Log Files (Linux vs. Windows)**

Logs are the "black box" of a computer.

* **Linux Logs:** Mostly stored in `/var/log/`.
* `auth.log`: Tracks logins and `sudo` attempts.
* `syslog`: General system messages.


* **Windows Logs:** Managed by the Event Viewer but accessible via shell using `Get-WinEvent` (PowerShell).
* **Application:** Software events.
* **System:** Driver/Hardware events.
* **Security:** Login/Logout and permission changes (Crucial for security).



---

## **3. Data Processing (Delimited, XML, and JSON)**

Attackers often export data in structured formats. A defender must know how to parse them.

* **Delimited Files (CSV/TSV):** Handled easily by `cut` or `awk`.
* **JSON:** The standard for modern web logs and APIs.
* **Tool:** `jq` is the industry-standard command-line processor for JSON.
* *Ex:* `cat logs.json | jq '.ip_address'`


* **XML:** Often found in Windows Event logs. Used with `XPath` queries to find specific data points.

---

## **4. Data Analysis & Anomaly Detection**

### **Web Server Access Logs**

A standard log (like Apache or Nginx) contains: **IP Address, Timestamp, Request Method (GET/POST), and Status Code (200, 404, 500).**

### **The "Security Analysis Pipeline"**

To find an attacker, you often follow this flow:

1. **Finding Uniqueness:** Use `sort | uniq -c` to count occurrences.
2. **Identifying Anomalies:** If one IP address has 10,000 "404 Not Found" errors, it is likely a **Directory Brute Force** attack.
3. **Histograms:** Visualizing the frequency of events over time to spot "spikes" in traffic.

---

## **5. Network and Filesystem Monitoring**

### **Network Monitoring**

* **`netstat -ant`**: Shows all active network connections. Look for "ESTABLISHED" connections to unknown foreign IPs.
* **`lsof -i`**: Shows which process is using which network port.

### **Filesystem Monitoring**

* **`tripwire` / `aide**`: Tools that create a "fingerprint" (hash) of your files. If a hacker modifies `/etc/shadow`, the hash changes, and the monitor alerts you.
* **`find / -mtime -1`**: Finds every file modified in the last 24 hours.

---

## **6. Script Obfuscation**

Obfuscation is the act of making code difficult for humans to read while keeping it functional for the computer.

* **Why use it?** * *Attackers:* To hide malicious intent from Antivirus.
* *Defenders:* To protect intellectual property (rare).


* **Methods:**
* **Base64 Encoding:** Turning a command into a string of random-looking text.
* **Variable Mangling:** Replacing clear names like `$password` with `$a1_x`.



---

## **The "Defensive Guard" Program**

This script performs basic security data collection and anomaly detection. Use this as your logic example for Unit III.

```bash
#!/bin/bash

# --- DEFENSIVE DATA COLLECTION SCRIPT ---

echo "Starting Security Audit..."
LOG_FILE="/var/log/auth.log"
REPORT="security_report.txt"

# 1. Gathering System Info
echo "--- System Info ---" > $REPORT
uname -a >> $REPORT

# 2. Identifying Anomalies (Failed Login Attempts)
echo -e "\n--- Top 5 Failed Login IP Addresses ---" >> $REPORT
# Analysis Logic: Filter "Failed", cut the IP column, sort, count, and show top 5
grep "Failed password" $LOG_FILE | cut -d' ' -f11 | sort | uniq -c | sort -nr | head -5 >> $REPORT

# 3. Network Monitoring (Uniqueness in Data)
echo -e "\n--- Unique Active Connections ---" >> $REPORT
netstat -ant | awk '{print $5}' | cut -d: -f1 | sort | uniq >> $REPORT

# 4. Filesystem Monitoring (Find files modified in last hour)
echo -e "\n--- Recently Modified Files (/etc) ---" >> $REPORT
find /etc -mmin -60 >> $REPORT

echo "Audit Complete. Report saved to $REPORT"

```

---

### **Preparation for the 10-Mark Question**

If a question asks: **"How do you identify a web-based attack using shell tools?"**

1. Mention **Data Collection**: Use `tail` to monitor the access log.
2. Mention **Data Analysis**: Use `grep "404"` to find failed page requests.
3. Mention **Uniqueness**: Use `sort | uniq -c` to find the IP address hitting the server the most.
4. Mention **Conclusion**: If the count is abnormally high, it's an anomaly/attack.

**Would you like me to create a table of Windows Event IDs that are most important for defensive security?**
