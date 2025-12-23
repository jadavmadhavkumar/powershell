Below is **clean, exam-ready PowerShell code** for **each topic**, written in a **simple, separate, and clearly labeled way** so it can be directly used in **practicals and theory exams**.

---

# **PowerShell Scripting – Code Examples**

---

## **1. Special Variables**

```powershell
# Display PowerShell version
$PSVersionTable

# Check last command status
Get-Date
$?

# Show all errors
$Error

# Environment variable
$env:USERNAME
```

---

## **2. Operators**

```powershell
$a = 10
$b = 5

# Arithmetic operators
$a + $b
$a - $b
$a * $b
$a / $b

# Comparison operators
$a -eq $b
$a -gt $b
$a -lt $b

# Logical operators
($a -gt 5) -and ($b -lt 10)
```

---

## **3. Looping**

### **For Loop**

```powershell
for ($i = 1; $i -le 5; $i++) {
    Write-Output "Count: $i"
}
```

### **Foreach Loop**

```powershell
$names = "Admin", "User", "Guest"
foreach ($name in $names) {
    Write-Output $name
}
```

### **While Loop**

```powershell
$i = 1
while ($i -le 3) {
    Write-Output $i
    $i++
}
```

---

## **4. Conditions**

```powershell
$marks = 75

if ($marks -ge 60) {
    Write-Output "Pass"
}
elseif ($marks -ge 40) {
    Write-Output "Average"
}
else {
    Write-Output "Fail"
}
```

---

## **5. Arrays**

```powershell
# Create array
$numbers = 10, 20, 30, 40

# Access elements
$numbers[0]

# Loop through array
foreach ($num in $numbers) {
    Write-Output $num
}
```

---

## **6. Hash Tables**

```powershell
# Create hash table
$user = @{
    Name = "Admin"
    Role = "Security"
    Status = "Active"
}

# Access value
$user["Role"]

# Loop through hash table
$user.GetEnumerator() | ForEach-Object {
    Write-Output "$($_.Key): $($_.Value)"
}
```

---

## **7. Regex**

```powershell
$email = "admin123@gmail.com"

# Check email format
if ($email -match "^\w+@\w+\.\w+$") {
    Write-Output "Valid Email"
}
else {
    Write-Output "Invalid Email"
}
```

---

## **8. Blacklists**

```powershell
# Blacklisted applications
$blacklist = "cmd.exe", "powershell.exe", "nc.exe"

$process = "cmd.exe"

if ($blacklist -contains $process) {
    Write-Output "Blocked: $process"
}
else {
    Write-Output "Allowed"
}
```

---

## **9. Alias**

```powershell
# View alias for a command
Get-Alias ls

# Create a new alias
Set-Alias ll Get-ChildItem

# Use alias
ll
```

---

## **Exam Tip (Write This in Conclusion)**

These PowerShell scripting features enable automation, decision-making, data handling, pattern matching, and security enforcement, making PowerShell a powerful tool for system administration and defensive security operations.

---


