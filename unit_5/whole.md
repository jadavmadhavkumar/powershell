
w is **exam-oriented, long-answer content (10+ marks each)** for

## **UNIT – V: Advanced PowerShell Scripting**

Each answer is written in a **university-exam format** with **definition, explanation, features, examples, advantages, and use cases**, suitable for **10–15 mark questions**.

---

# **UNIT – V: Advanced PowerShell Scripting**

---

## **1. PowerShell Advanced Functions** *(10–15 Marks)*

Advanced functions are PowerShell functions that behave like **compiled cmdlets**. They support features such as **parameter binding, pipeline input, validation, and error handling**, making them powerful tools for automation.

Advanced functions use the `[CmdletBinding()]` attribute, which enables cmdlet-like behavior.

**Features of Advanced Functions:**

* Named parameters
* Parameter validation
* Pipeline input support
* Error handling with `try-catch`
* Support for `-Verbose` and `-Debug`

**Example:**

```powershell
function Get-Square {
    [CmdletBinding()]
        param (
                [Parameter(Mandatory)]
                        [int]$Number
                            )
                                process {
                                        $Number * $Number
                                            }
                                            }
                                            ```

                                            **Advantages:**

                                            * Reusable code
                                            * Professional script structure
                                            * Better error handling
                                            * Used in production environments

                                            ---

                                            ## **2. PowerShell Remoting Capabilities** *(10–15 Marks)*

                                            PowerShell Remoting allows administrators to **execute commands on remote computers** securely using the **WS-Management (WSMan) protocol**.

                                            ### **Remoting Concepts**

                                            * Uses **WinRM service**
                                            * Secure communication (Kerberos / HTTPS)
                                            * One-to-one and one-to-many execution
                                            * Session-based or command-based execution

                                            ### **Invoking Remote Commands**

                                            ```powershell
                                            Invoke-Command -ComputerName Server01 -ScriptBlock {
                                                Get-Service
                                                }
                                                ```

                                                ### **Processing Output**

                                                Remote commands return objects that can be filtered, sorted, and exported locally.

                                                **Advantages:**

                                                * Centralized administration
                                                * Automation at scale
                                                * Used in enterprise networks

                                                ---

                                                ## **3. Objects in Windows PowerShell** *(10–15 Marks)*

                                                PowerShell works with **objects**, not plain text. Each object contains **properties and methods**, enabling powerful data manipulation.

                                                **Object Structure:**

                                                * Properties → store data
                                                * Methods → perform actions

                                                **Example:**

                                                ```powershell
                                                $proc = Get-Process
                                                $proc.Name
                                                ```

                                                **Benefits of Object-Based Pipeline:**

                                                * Accurate data processing
                                                * No text parsing required
                                                * Rich metadata access

                                                Objects are fundamental to PowerShell’s power and flexibility.

                                                ---

                                                ## **4. Error Handling Concepts** *(10–15 Marks)*

                                                Error handling ensures scripts **continue running safely** and failures are managed gracefully.

                                                PowerShell supports:

                                                * **Terminating errors**
                                                * **Non-terminating errors**

                                                ### **Terminating Errors**

                                                Stop script execution immediately.

                                                ### **Non-Terminating Errors**

                                                Display error but continue execution.

                                                **Error Handling Tools:**

                                                * `try-catch-finally`
                                                * `-ErrorAction`
                                                * Automatic variables

                                                ---

                                                ## **5. Handling Errors using `$?`, `$Error`, and `$LastExitCode`** *(10–15 Marks)*

                                                PowerShell provides automatic variables to track command success or failure.

                                                ### `$?`

                                                * Returns **True or False**
                                                * Indicates success of last command

                                                ### `$Error`

                                                * Stores recent error objects
                                                * Useful for debugging

                                                ### `$LastExitCode`

                                                * Captures exit code of native executables

                                                **Example:**

                                                ```powershell
                                                Get-Item test.txt
                                                $?
                                                ```

                                                These variables help in **error monitoring and logging**.

                                                ---

                                                ## **6. Error Record Object Anatomy** *(10–15 Marks)*

                                                Every PowerShell error is stored as an **ErrorRecord object**.

                                                **Key Components:**

                                                * Exception
                                                * CategoryInfo
                                                * TargetObject
                                                * FullyQualifiedErrorId

                                                **Example:**

                                                ```powershell
                                                try {
                                                    Get-Item "C:\NoFile.txt"
                                                    }
                                                    catch {
                                                        $_.Exception.Message
                                                        }
                                                        ```

                                                        Understanding error anatomy helps in **advanced debugging and incident response**.

                                                        ---

                                                        ## **7. Working with Textual Files** *(10–15 Marks)*

                                                        Textual file handling is essential for logs, reports, and configuration files.

                                                        **Common Cmdlets:**

                                                        * `Get-Content`
                                                        * `Set-Content`
                                                        * `Add-Content`
                                                        * `Select-String`

                                                        **Example:**

                                                        ```powershell
                                                        Get-Content log.txt
                                                        ```

                                                        Used heavily in **security monitoring and automation**.

                                                        ---

                                                        ## **8. Saving Information into Textual and CSV Files** *(10–15 Marks)*

                                                        PowerShell allows exporting data into text and CSV formats.

                                                        ### Text Files

                                                        ```powershell
                                                        Get-Process | Out-File process.txt
                                                        ```

                                                        ### CSV Files

                                                        ```powershell
                                                        Get-Service | Export-Csv services.csv -NoTypeInformation
                                                        ```

                                                        **Advantages:**

                                                        * Easy reporting
                                                        * Data sharing
                                                        * Audit trail creation

                                                        ---

                                                        ## **9. Reading Information from Textual and CSV Files** *(10–15 Marks)*

                                                        Reading stored data allows analysis and automation.

                                                        ### Text Files

                                                        ```powershell
                                                        Get-Content data.txt
                                                        ```

                                                        ### CSV Files

                                                        ```powershell
                                                        Import-Csv users.csv
                                                        ```

                                                        Imported CSV data becomes PowerShell objects for further processing.

                                                        ---

                                                        ## **10. Example Implementation of Error Handling Code** *(10–15 Marks)*

                                                        Below is a complete example demonstrating **robust error handling**:

                                                        ```powershell
                                                        try {
                                                            $file = "C:\data.txt"
                                                                Get-Content $file -ErrorAction Stop
                                                                }
                                                                catch {
                                                                    Write-Host "Error occurred:" $_.Exception.Message
                                                                    }
                                                                    finally {
                                                                        Write-Host "Script execution completed."
                                                                        }
                                                                        ```

                                                                        **Explanation:**

                                                                        * `try` → executes risky code
                                                                        * `catch` → handles errors
                                                                        * `finally` → cleanup operations

                                                                        This structure is widely used in **production-level scripts**.

                                                                        ---

                                                                        ## **Summary (Exam Conclusion Point)**

                                                                        Advanced PowerShell scripting enhances automation through:

                                                                        * Advanced functions
                                                                        * Remoting
                                                                        * Object-based processing
                                                                        * Robust error handling
                                                                        * Efficient file management

                                                                        These concepts are crucial for **enterprise administration, cybersecurity, and DevOps**.

                                                                        ---

                                                                        ### ✅ If you want, I can:

                                                                        * Convert this into **PDF exam notes**
                                                                        * Reduce answers to **exact word limits**
                                                                        * Add **diagram-based explanations**
                                                                        * Provide **model university answers**

                                                                        Just tell me 👍

