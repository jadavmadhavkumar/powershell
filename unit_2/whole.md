ince your exam covers **Unit II: Advanced Shell Scripting**, the focus shifts from basic commands to **automation, logic, and system administration**.

To secure high marks, you must demonstrate how the shell interacts with the system (Networking/Storage) and how to control the flow of a program (Loops/Logic).

---

## **1. System Administration & Management**

### **Package Management & Storage**

* **Package Management:** The tools used to install, update, and remove software.
* *Debian/Ubuntu:* Uses `apt`. (Ex: `sudo apt install git`)
* *Red Hat/CentOS:* Uses `yum` or `dnf`.


* **Storage Media:** Managing disks and partitions.
* `lsblk`: Lists all block devices (hard drives).
* `mount / umount`: Connects/disconnects a physical drive to the file system tree.
* `df -h`: Shows disk space usage in human-readable format.



### **Networking & Searching**

* **Networking:** Commands like `ip addr` (view IP), `ping` (check connectivity), and `netstat` (view active connections).
* **Searching for Files:** * `locate`: Quick search using a database.
* `find`: Powerful, real-time search based on attributes.
* *Ex:* `find /home -name "*.sh"` (Finds all shell scripts in /home).



---

## **2. Data Processing & Regular Expressions**

### **Archiving and Backup**

* **`tar` (Tape Archive):** The standard for grouping files.
* *Create:* `tar -cvf backup.tar /folders`
* *Extract:* `tar -xvf backup.tar`


* **`gzip` / `bzip2`:** Used to compress the archives to save space.

### **Regular Expressions (Regex) & Text Processing**

Regex is a pattern-matching language.

* `^`: Matches the start of a line.
* `$`: Matches the end of a line.
* `.`: Matches any single character.
* **Tools:**
* `grep`: Searches text for patterns.
* `sed`: Stream Editor (used for find-and-replace).
* `awk`: Powerful tool for processing data in columns/fields.



---

## **3. The Scripting Lifecycle: Project Design**

When starting a project, you should use **Top-Down Design**. This means breaking a large task into smaller, manageable sub-tasks (functions) before writing any code.

1. **Define the Goal:** What should the script do?
2. **Modularize:** Break it into "Check Space," "Perform Backup," and "Send Email."
3. **Pseudocode:** Write the logic in plain English before coding.

---

## **4. Flow Control: Making Decisions**

### **Branching with `if**`

Used for conditional logic.

```bash
if [ $age -ge 18 ]; then
    echo "You can vote."
    else
        echo "Too young."
        fi

        ```

        ### **Looping (`while`, `until`, `for`)**

        * **`for`**: Runs for a specific list of items.
        * *Ex:* `for i in {1..5}; do echo $i; done`


        * **`while`**: Runs as long as a condition is true.
        * **`until`**: Runs until a condition becomes true.

        ---

        ## **5. Advanced Data Structures**

        * **Strings and Numbers:** Bash treats everything as strings by default. Use `$(( ))` for arithmetic.
        * **Arrays:** Storing multiple values in one variable.
        * *Ex:* `os=("Linux" "Windows" "macOS")`
        * *Access:* `${os[0]}` prints "Linux".



        ---

        ## **The "Exam Hero" Script**

        This program combines **Unit II** concepts: **Arrays, Flow Control, Storage check, and Searching.** Use this as your "master example" in the exam.

        ```bash
        #!/bin/bash

        # 1. Array of directories to check
        TARGETS=("/var/log" "/etc" "/home")

        # 2. Starting a Project: Header
        echo "--- SYSTEM HEALTH AND SEARCH TOOL ---"

        # 3. Reading Keyboard Input
        read -p "Enter a filename to search for: " SEARCH_FILE

        # 4. Looping with 'for'
        for DIR in "${TARGETS[@]}"; do
            echo "Checking directory: $DIR"
                
                    # 5. Searching for files
                        RESULT=$(find $DIR -name "$SEARCH_FILE" 2>/dev/null)
                            
                                # 6. Branching with 'if'
                                    if [ -z "$RESULT" ]; then
                                            echo "  - No file found in $DIR."
                                                else
                                                        echo "  - FOUND: $RESULT"
                                                            fi
                                                            done

                                                            # 7. Storage check (Formatting Output)
                                                            echo "-------------------------------------"
                                                            echo "Current Disk Usage:"
                                                            df -h | grep '^/dev/'

                                                            # 8. Troubleshooting Tip: Use 'set -x' at the top to debug 
                                                            # if the script behaves unexpectedly.

                                                            ```

                                                            ---

                                                            ### **Quick Troubleshooting Tips for the Exam:**

                                                            1. **`set -x`**: Prints every command before executing it (excellent for debugging).
                                                            2. **`set -e`**: Exit the script immediately if a command fails.
                                                            3. **Permissions**: Always remember `chmod +x scriptname.sh` to make it runnable.

                                                            **Would you like me to create a "Cheat Sheet" table of the most common `if` test operators (like -f for files, -d for directories) for you?**
