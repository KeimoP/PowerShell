Write-Host " "
Write-Host " "
Write-Host " "
Write-Host "*************************"
$env:COMPUTERNAME
Write-Host "*************************"
$env:OS
Write-Host "*************************"
Get-NetIPAddress | Format-Table IPAddress
Write-Host "*************************"
Get-NetAdapter | Format-Table Name, InterfaceDescription
Write-Host "*************************"
(Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1gb 
Write-Host "GB"
Write-Host "*************************"
WMIC CPU Get Name
Write-Host "*************************"
Get-CimInstance win32_VideoController | Format-Table DeviceID
Write-Host "*************************"
Get-LocalUser | Format-Table Name
Write-Host "*************************"