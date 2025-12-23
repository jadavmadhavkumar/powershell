Below is **clean, exam-ready PowerShell code** that demonstrates **Saving Information into Textual and CSV Files**, with **clear comments** and **multiple examples** (exactly what examiners expect).

---

# **Saving Information into Textual and CSV Files – PowerShell Code**

---

## **1. Saving Information into a Text File**

### **Using `Out-File`**

```powershell
# Save running processes into a text file
Get-Process |
Out-File "process_list.txt"
```

---

### **Using `Set-Content`**

```powershell
# Write system information to a text file (overwrites file)
"System Information:" | Set-Content "system_info.txt"
```

---

### **Using `Add-Content`**

```powershell
# Append date and time to existing text file
"Log Entry: $(Get-Date)" | Add-Content "system_info.txt"
```

---

## **2. Saving Information into a CSV File**

### **Using `Export-Csv`**

```powershell
# Export service details to a CSV file
Get-Service |
Select-Object Name, Status |
Export-Csv "services.csv" -NoTypeInformation
```

---

### **Appending Data to a CSV File**

```powershell
# Append process information to an existing CSV
Get-Process |
Select-Object Name, CPU |
Export-Csv "processes.csv" -Append -NoTypeInformation
```

---

## **3. Saving Custom Objects to Text and CSV**

### **Custom Object to Text File**

```powershell
$user = "Admin"
$time = Get-Date

"User: $user | Time: $time" |
Out-File "user_log.txt"
```

---

### **Custom Object to CSV File**

```powershell
$data = [PSCustomObject]@{
    Username = "Admin"
    LoginTime = Get-Date
    Status = "Success"
}

$data | Export-Csv "login_report.csv" -NoTypeInformation
```

---

## **4. Saving Output with Formatting (Exam Favorite)**

```powershell
# Format output before saving to text file
Get-Process |
Format-Table Name, CPU -AutoSize |
Out-File "formatted_processes.txt"
```

---

## **5. Saving Error Output to Text File**

```powershell
# Save error messages to a text file
Get-Item "C:\NoFile.txt" 2> error_log.txt
```

---

## **6. Saving Command Output with Timestamp**

```powershell
# Save event log entries with timestamp
Get-EventLog -LogName System -Newest 5 |
Out-File "event_log_$(Get-Date -Format yyyyMMdd).txt"
```

---

## **7. Summary (Exam Conclusion Line)**

* `Out-File` → Saves formatted text output
* `Set-Content` → Writes or replaces text content
* `Add-Content` → Appends text data
* `Export-Csv` → Saves structured data in CSV format

These commands are widely used for **logging, reporting, auditing, and security analysis**.


