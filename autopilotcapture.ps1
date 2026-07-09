Set-ExecutionPolicy RemoteSigned
Install-Script -Name Get-WindowsAutoPilotInfo
Get-WindowsAutoPilotInfo -OutputFile C:\Users\Public\AutoPilotHWID.csv
cd C:/Users/Public
copy AutoPilotHWID.csv D:
