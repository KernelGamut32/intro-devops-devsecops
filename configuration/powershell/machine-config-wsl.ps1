# Execute from PowerShell as Run as Administrator.
# This script will install WSL2 and Ubuntu 22.04 LTS. Before running this script, 
# execute 'Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force' in the PowerShell 
# instance to allow this script to run.

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2204 -OutFile D:\Ubuntu.appx -UseBasicParsing

Rename-Item D:\Ubuntu.appx D:\Ubuntu.zip
Expand-Archive D:\Ubuntu.zip D:\Ubuntu

Rename-Item D:\Ubuntu\Ubuntu_2204.1.7.0_x64.appx D:\Ubuntu\Ubuntu_2204.zip
Expand-Archive D:\Ubuntu\Ubuntu_2204.zip D:\Ubuntu\2204

$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";D:\Ubuntu\2204", "User")
