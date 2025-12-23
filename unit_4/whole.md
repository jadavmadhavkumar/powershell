
w is **exam-oriented, long-answer content (≈10 marks each)** for **UNIT–IV: Introduction to PowerShell Scripting**.
Each topic is written in a **structured format** (Definition → Explanation → Examples → Key Points), which is exactly how **10-mark answers are evaluated**.

---

# **UNIT – IV: Introduction to PowerShell Scripting**

---

## **1. Overview of PowerShell** *(10 Marks)*

PowerShell is a **task automation and configuration management framework** developed by Microsoft. It is built on the **.NET framework** and uses a **command-line shell** along with a **scripting language**. Unlike traditional shells that work with plain text, PowerShell works with **objects**, making it powerful and flexible.

PowerShell uses **cmdlets**, which are lightweight commands following a **Verb–Noun** naming convention such as `Get-Process` or `Set-Service`. It is cross-platform and works on **Windows, Linux, and macOS**.

PowerShell is widely used for **system administration, automation, incident response, and security operations**.

**Key Features:**

* Object-based pipeline
* Extensive automation support
* Strong integration with Windows
* Support for scripting and remoting

---

## **2. Environment Setup** *(10 Marks)*

The PowerShell environment includes the **PowerShell engine, execution policy, modules, and profiles**. Environment setup ensures scripts run securely and efficiently.

Key steps include:

* Installing PowerShell (Windows PowerShell / PowerShell Core)
* Configuring execution policy using `Set-ExecutionPolicy`
* Loading required modules
* Setting environment variables
* Creating PowerShell profiles for customization

Execution policies control script execution and prevent malicious scripts.

**Example:**

```powershell
Set-ExecutionPolicy RemoteSigned
```

---

## **3. PowerShell Integrated Script Environment (ISE)** *(10 Marks)*

PowerShell ISE is a **graphical scripting environment** used to write, test, and debug PowerShell scripts. It provides:

* Script pane
* Console pane
* Debugging tools
* Syntax highlighting
* IntelliSense

ISE improves productivity by allowing developers to write and execute scripts in the same interface.

**Advantages:**

* Easier debugging
* User-friendly interface
* Better script management

---

## **4. Working with PowerShell Scripts** *(10 Marks)*

PowerShell scripts are stored in `.ps1` files. Scripts allow automation of repetitive administrative tasks.

Key concepts:

* Script execution
* Script parameters
* Script scope
* Comment-based help

**Example Script:**

```powershell
Write-Output "Hello PowerShell"
```

Scripts can be executed using:

```powershell
.\script.ps1
```

---

## **5. Cmdlets** *(10 Marks)*

Cmdlets are the core commands in PowerShell. They perform specific operations and return **objects**.

Characteristics:

* Verb-Noun format
* Single-purpose
* Pipeline support

**Examples:**

```powershell
Get-Process
Get-Service
Stop-Service
```

Cmdlets are discoverable using `Get-Command` and documented using `Get-Help`.

---

## **6. Files and Folders** *(10 Marks)*

PowerShell provides cmdlets to manage files and directories efficiently.

Common cmdlets:

* `Get-ChildItem`
* `New-Item`
* `Remove-Item`
* `Copy-Item`
* `Move-Item`

**Example:**

```powershell
Get-ChildItem C:\Logs
```

These cmdlets support filtering, recursion, and pipeline processing.

---

## **7. Dates and Timers** *(10 Marks)*

PowerShell uses the `.NET DateTime` object for handling dates and time.

Key cmdlets and methods:

* `Get-Date`
* Date arithmetic
* Timers and delays using `Start-Sleep`

**Example:**

```powershell
Get-Date
Start-Sleep -Seconds 5
```

Dates are commonly used in **logging, scheduling, and automation**.

---

## **8. File I/O** *(10 Marks)*

File Input/Output is used to read from and write to files.

Common cmdlets:

* `Get-Content`
* `Set-Content`
* `Add-Content`
* `Out-File`
* `Export-Csv`

**Example:**

```powershell
Get-Content log.txt
```

File I/O is essential for **logging, reporting, and forensic analysis**.

---

## **9. Advanced Cmdlets** *(10 Marks)*

Advanced cmdlets include powerful features such as:

* Error handling
* Parameter validation
* Pipeline input
* Advanced filtering

Examples:

```powershell
Where-Object
Select-Object
ForEach-Object
```

These cmdlets enable complex data processing and automation.

---

## **10. Special Variables** *(10 Marks)*

PowerShell provides automatic variables that store system information.

Examples:

* `$PSVersionTable`
* `$Error`
* `$Args`
* `$Env:PATH`
* `$?`

These variables help in debugging, environment detection, and scripting logic.

---

## **11. Operators** *(10 Marks)*

Operators are used to perform operations on variables and values.

Types:

* Arithmetic (`+`, `-`)
* Comparison (`-eq`, `-ne`)
* Logical (`-and`, `-or`)
* Assignment (`=`, `+=`)

Operators control logic and data manipulation in scripts.

---

## **12. Looping** *(10 Marks)*

Loops allow repeated execution of code.

Types:

* `for`
* `foreach`
* `while`
* `do-while`

**Example:**

```powershell
foreach ($i in 1..5) {
    Write-Output $i
    }
    ```

    Loops are essential for automation and batch processing.

    ---

    ## **13. Conditions** *(10 Marks)*

    Conditional statements control the flow of execution.

    Common structures:

    * `if`
    * `elseif`
    * `else`
    * `switch`

    **Example:**

    ```powershell
    if ($a -gt 10) {
        Write-Output "Greater"
        }
        ```

        Conditions are used for decision-making in scripts.

        ---

        ## **14. Arrays** *(10 Marks)*

        Arrays store multiple values in a single variable.

        **Example:**

        ```powershell
        $nums = 1,2,3,4
        ```

        Arrays support indexing, looping, and sorting.

        ---

        ## **15. Hash Tables** *(10 Marks)*

        Hash tables store data in **key-value pairs**.

        **Example:**

        ```powershell
        $user = @{Name="Admin"; Role="User"}
        ```

        Used for structured data storage and fast lookups.

        ---

        ## **16. Regex** *(10 Marks)*

        Regular expressions are used for pattern matching.

        **Example:**

        ```powershell
        "admin123" -match "\d+"
        ```

        Regex is widely used in **log analysis and validation**.

        ---

        ## **17. Blacklists** *(10 Marks)*

        Blacklists are used to block known malicious entities.

        **Example:**

        ```powershell
        $blacklist = "cmd.exe","powershell.exe"
        ```

        Used in **security monitoring and access control**.

        ---

        ## **18. Alias** *(10 Marks)*

        Aliases provide shortcuts for cmdlets.

        **Example:**

        ```powershell
        Get-Alias ls
        ```

        Aliases improve command-line efficiency.

        ---

        ## **19. WMIC & PowerShell Providers and Drives** *(10 Marks)*

        PowerShell providers allow access to data stores like:

        * File system
        * Registry
        * Certificate store
        * Environment variables

        WMIC is used for system information retrieval.

        ---

        ## **20. `$Args` Variable** *(10 Marks)*

        `$Args` stores unnamed command-line arguments passed to a script.

        **Example:**

        ```powershell
        Write-Output $Args[0]
        ```

        ---

        ## **21. `param` Statement** *(10 Marks)*

        The `param` statement defines named parameters.

        **Example:**

        ```powershell
        param($Name)
        ```

        Improves script usability and readability.

        ---

        ## **22. Passing Data by Value and by Reference** *(10 Marks)*

        * **By Value**: A copy of data is passed.
        * **By Reference**: Original data can be modified using `[ref]`.

        **Example:**

        ```powershell
        function Test([ref]$x) {
            $x.Value = 10
            }
            ```

            Used in advanced scripting and function design.

            ---

            ### ✅ If you want, I can:

            * Convert this into **PDF exam notes**
            * Reduce to **exact 10-mark answers**
            * Add **diagrams and flowcharts**
            * Create **model answers for university exams**

            Just tell me 👍

