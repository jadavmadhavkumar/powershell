# 
# this powershell code that work for me and i want lear ps1 fast i can  with one day 
# make sure i  want to do  every thing 
#
#
#

Write-Host "starting defensive data collection "  -ForegroundColor Cyan 

# 1.  cur equivalent -  extract specific filds 
#
#
#
#
Write-Host "[+] collection local user accounts" 
Get-LocalUser |
Select-Object Name , Enabled |
Export-Csv ".\local_users.csv"  -NoTyeinformation

# 2.  file equivalent -Identify file types 
#
Write-Host "[+] Analyzing executable file in system32 " 
Get-ChildItem "C:\Windows\system32" -File |
Select-Object Name , Extension , Lenght |
Export-Csv ".\system32_file_type.csv" -NoTyeinformation


#3 head equivalent -  # Parameter help description

Write-Host "[+] previewing Windows update log " 
Get-Content "C:\Windows\WindowsUpdate.log"  -TotaleCount 10 |
Out-File ".\Windows_update_preview.txt"

#4 reg - collection  Windows  regidter data
Write-Host "[+]  Export  statup register key"
reg export HKLM\software\microsoft\windows\CurrentVesion\run ".\statup_key.txt"

# 5.  wevunit - collection  windows logs 

Write-Host "[+] export  security evenmt logs " 
wevunit epl System ".\system_log.evtx"

Write-Host "data-collection complet seccessfuly."  -ForegroundColor Green 
