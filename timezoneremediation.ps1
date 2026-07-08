$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate"
$RegName = "Start"
$DesiredValue = 3

try
{
    Set-ItemProperty `
        -Path $RegPath `
        -Name $RegName `
        -Value $DesiredValue `
        -Force `
        -ErrorAction Stop

    Start-Service tzautoupdate -ErrorAction SilentlyContinue
}
catch
{
    Write-Error "Failed to set registry value: $_"
    exit 1
}


$Value = (Get-ItemProperty -Path $RegPath -Name $RegName).$RegName

if ($Value -eq $DesiredValue)
{
    Write-Output "Success - Automatic timezone enabled (Start = $Value)"
    exit 0
}
else
{
    Write-Output "Failed - Registry value did not update (Start = $Value)"
    exit 1
}
