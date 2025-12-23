ince your exam covers **Unit I: Introduction to Shell Scripting** focusing on **Bash** (though you mentioned PowerShell, your syllabus list is classic Linux/Bash), I have prepared a comprehensive, multi-section guide. This is structured to help you score high marks by defining concepts, explaining mechanics, and providing syntax examples.

---

# **UNIT I: Fundamentals of Shell Scripting (Bash)**

## **1. What is "The Shell"?**

The shell is a **command-line interpreter** that acts as an interface between the user and the Operating System Kernel. It takes commands entered by the user from the keyboard and passes them to the operating system to execute.

* **The Kernel:** The core of the OS that manages hardware.
* **The Shell:** The "outer layer" that protects the kernel and provides a way for users to interact with it.
* **Common Shells:** `bash` (Bourne Again Shell), `sh`, `zsh`, and `fish`.

---

## **2. The File System Tree and Navigation**

Unlike Windows (which uses drives like `C:`), Linux/Bash uses a **hierarchical tree structure** starting from a single **Root** directory denoted by a forward slash `/`.

* **Key Directories:**
* `/bin`: Essential command binaries.
* `/etc`: System configuration files.
* `/home`: User personal folders.
* `/root`: Home directory for the System Administrator.


* **Navigation Commands:**
* `pwd`: Print Working Directory (Where am I?).
* `cd`: Change Directory. (`cd ..` moves up one level).
* `ls`: List files and directories.



---

## **3. Manipulating Files and Directories**

This involves the "CRUD" operations (Create, Read, Update, Delete) via the command line.

| Task | Command | Example |
| --- | --- | --- |
| **Create Folder** | `mkdir` | `mkdir MyScripts` |
| **Create File** | `touch` | `touch notes.txt` |
| **Copy** | `cp` | `cp file.txt backup.txt` |
| **Move/Rename** | `mv` | `mv old.txt new.txt` |
| **Remove** | `rm` | `rm -rf folderName` (Careful!) |

---

## **4. I/O Redirection**

In Linux, "Everything is a file." Redirection allows us to change where input comes from and where output goes.

* **Standard Output (`>`)**: Redirects output to a file (overwrites).
* *Ex:* `ls > files.txt`


* **Append (`>>`)**: Adds output to the end of a file without deleting content.
* *Ex:* `date >> logs.txt`


* **Pipes (`|`)**: Takes the output of one command and sends it as input to another.
* *Ex:* `ls | grep "txt"` (Lists files, then filters for those containing "txt").



---

## **5. Expansion and Wildcards**

The shell processes text before executing a command. This is called **expansion**.

* **Pathname Expansion (Wildcards):**
* `*`: Matches any character. (`ls *.jpg` lists all JPEGs).
* `?`: Matches exactly one character.


* **Arithmetic Expansion:**
* `echo $((2 + 2))` outputs `4`.


* **Variable Expansion:**
* `echo $USER` outputs the current username.



---

## **6. Permissions**

Linux is a multi-user system, so security is handled via permissions.
If you run `ls -l`, you see strings like `-rwxr-xr--`.

* **r** = Read | **w** = Write | **x** = Execute.
* **Groups:** Owner, Group, Others.
* **Changing Permissions:** `chmod`
* *Ex:* `chmod +x script.sh` (Makes a script executable).



---

## **7. Job Control**

This is the shell's ability to manage multiple processes (jobs) at once.

* **Foreground to Background:** Pressing `Ctrl + Z` suspends a process; typing `bg` moves it to the background.
* **`jobs`**: Lists all active jobs.
* **`kill`**: Terminates a process using its Process ID (PID).

---

## **8. Introduction to "vi" Editor**

`vi` (or `vim`) is a powerful text editor found in almost all Unix-like systems. It has two main modes:

1. **Command Mode:** (Default) Used for navigation and deleting text.
2. **Insert Mode:** Used for typing text (press `i` to enter this mode).
3. **To Save and Exit:** Press `Esc`, then type `:wq` and Enter.

---

## **9. Customizing the Environment**

Your shell behavior is defined by environment variables.

* **`PS1`**: The variable that controls your **command prompt** look.
* *Ex:* `export PS1="[\u@\h \W]\$ "` (Displays [user@host directory]$).


* **`.bashrc`**: A script file that runs every time you open a new shell. You put aliases and exports here.

---

### **Exam Tip: A "10 Mark" Sample Script**

If asked to write a script demonstrating these concepts:

```bash
#!/bin/bash
# A script to backup txt files and log the action

DIR="Backup_Folder"

# 1. Create Directory (Manipulation)
mkdir -p $DIR

# 2. Expansion and Redirection
cp *.txt $DIR/ 2> error.log

# 3. Output with Date (I/O Redirection)
echo "Backup completed on $(date)" >> $DIR/log.txt

# 4. Permissions
chmod 700 $DIR/log.txt

echo "Task Done!"

```

**Would you like me to explain any specific command from this list in more detail, or should we practice a specific logic like "If/Else" loops?**
