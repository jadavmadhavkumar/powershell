Below is a **complete, exam-ready, in-depth explanation** covering **all requested topics**, written to score **10–15 marks per question**.
Each section includes **definition, working principle, syntax, examples, differences, and use cases**.

---

# **WMIC & PowerShell Providers and Drives**

# **`$Args` Variable**

# **`param` Statement**

# **Passing Data by Value and by Reference**

---

## **1. WMIC & PowerShell Providers and Drives**

---

## **1.1 WMIC (Windows Management Instrumentation Command-line)**

### **Definition**

WMIC is a **command-line interface** used to query and manage **Windows system information** via **WMI (Windows Management Instrumentation)**.

WMIC provides access to:

* Hardware information
* OS details
* Processes
* Services
* Users

---

### **How WMIC Works**

* Communicates with **WMI repository**
* Uses **CIM classes**
* Outputs system data in text form

---

### **Examples**

```powershell
wmic os get caption,version
```

```powershell
wmic process list brief
```

---

### **Advantages**

* Detailed system information
* Useful for forensic analysis
* Works remotely

---

### **Limitations**

* Text-based output
* Deprecated in modern Windows
* Replaced by PowerShell CIM cmdlets

---

## **1.2 PowerShell Providers**

### **Definition**

PowerShell providers allow **non-file system data stores** to be accessed like **file system directories**.

---

### **Common Providers**

| Provider    | Purpose               |
| ----------- | --------------------- |
| FileSystem  | Files & folders       |
| Registry    | Windows Registry      |
| Environment | Environment variables |
| Certificate | Certificate store     |
| Variable    | PowerShell variables  |

---

### **How Providers Work**

* Expose data as **drives**
* Enable navigation using `cd`, `dir`, `ls`

---

### **Example**

```powershell
Get-PSProvider
```

---

## **1.3 PowerShell Drives**

### **Definition**

PowerShell drives are **logical data locations** exposed by providers.

---

### **Examples**

```powershell
Get-PSDrive
```

```powershell
Set-Location HKLM:\Software
```

---

### **Custom Drive Example**

```powershell
New-PSDrive -Name Logs -PSProvider FileSystem -Root C:\Logs
```

---

## **2. `$Args` Variable**

---

## **2.1 Definition**

`$Args` is an **automatic array variable** that stores **unnamed arguments** passed to a script or function.

---

## **2.2 How `$Args` Works**

* Arguments are stored **in order**
* Indexed starting from `$Args[0]`
* Used when no `param` block exists

---

## **2.3 Example**

```powershell
# Script: test.ps1
Write-Output "First Argument: $Args[0]"
Write-Output "Second Argument: $Args[1]"
```

Execution:

```powershell
.\test.ps1 Admin 123
```

Output:

```
First Argument: Admin
Second Argument: 123
```

---

## **2.4 Limitations**

* No type checking
* Poor readability
* Not recommended for complex scripts

---

## **3. `param` Statement**

---

## **3.1 Definition**

The `param` statement is used to define **named parameters** for scripts and functions.

---

## **3.2 How `param` Works**

* Must be placed at the **top of the script**
* Supports data types
* Supports default values
* Improves readability

---

## **3.3 Syntax**

```powershell
param (
    [string]$Name,
    [int]$Age
)
```

---

## **3.4 Example**

```powershell
param (
    [string]$User,
    [int]$Id
)

Write-Output "User: $User"
Write-Output "ID: $Id"
```

Execution:

```powershell
.\script.ps1 -User Admin -Id 101
```

---

## **3.5 Advantages**

* Named arguments
* Validation support
* Professional scripting standard
* Supports help documentation

---

## **4. `$Args` vs `param` (Exam Favorite Table)**

| Feature       | `$Args` | `param` |
| ------------- | ------- | ------- |
| Argument Type | Unnamed | Named   |
| Readability   | Low     | High    |
| Type Safety   | No      | Yes     |
| Validation    | No      | Yes     |
| Recommended   | ❌       | ✅       |

---

## **5. Passing Data by Value**

---

## **5.1 Definition**

Passing by value means a **copy of the variable** is passed to a function. Changes made inside the function **do not affect the original variable**.

---

## **5.2 How It Works**

* PowerShell uses pass-by-value by default
* Safer and prevents unintended changes

---

## **5.3 Example**

```powershell
function TestValue($x) {
    $x = 50
}

$a = 10
TestValue $a
$a
```

Output:

```
10
```

---

## **6. Passing Data by Reference**

---

## **6.1 Definition**

Passing by reference allows a function to **modify the original variable**.

---

## **6.2 How It Works**

* Uses `[ref]` keyword
* Changes reflect outside the function

---

## **6.3 Example**

```powershell
function TestRef([ref]$x) {
    $x.Value = 50
}

$a = 10
TestRef ([ref]$a)
$a
```

Output:

```
50
```

---

## **7. Comparison: By Value vs By Reference**

| Feature           | By Value             | By Reference    |
| ----------------- | -------------------- | --------------- |
| Data Copy         | Yes                  | No              |
| Original Variable | Unchanged            | Modified        |
| Safety            | High                 | Lower           |
| Performance       | Lower for large data | Higher          |
| Use Case          | Simple data          | Complex updates |

---

## **8. Practical Use Cases**

* WMIC → Forensic analysis, system inventory
* Providers & Drives → Registry and certificate access
* `$Args` → Simple scripts
* `param` → Enterprise scripts
* By Value → Safe operations
* By Reference → Performance-critical scripts

---

## **9. Security & Automation Relevance**

* SOC automation
* Incident response scripts
* Remote system administration
* Secure parameter handling

---

## **10. Exam-Ready Conclusion**

WMIC and PowerShell providers enable deep system interaction, while `$Args` and `param` manage script inputs. Passing data by value and reference controls how data flows through scripts, making these concepts essential for advanced PowerShell scripting and secure automation.

---

