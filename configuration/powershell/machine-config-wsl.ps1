# Execute from the D:\ home drive

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2204 -OutFile D:\Ubuntu.appx -UseBasicParsing

Rename-Item D:\Ubuntu.appx D:\Ubuntu.zip
Expand-Archive D:\Ubuntu.zip D:\Ubuntu

Rename-Item D:\Ubuntu\Ubuntu_2204.1.7.0_x64.appx D:\Ubuntu\Ubuntu_2204.zip
Expand-Archive D:\Ubuntu\Ubuntu_2204.zip D:\Ubuntu\2204

$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";D:\Ubuntu\2204", "User")
