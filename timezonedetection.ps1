$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate"
$RegName = "Start"

try
{
    $Value = (Get-ItemProperty -Path $RegPath -Name $RegName -ErrorAction Stop).$RegName

    if ($Value -eq 3)
    {
        Write-Output "Compliant - Automatic timezone is enabled (Start = $Value)"
        exit 0
    }
    else
    {
        Write-Output "Non-Compliant - Automatic timezone is disabled (Start = $Value)"
        exit 1
    }
}
catch
{
    Write-Output "Non-Compliant - Unable to read registry: $_"
    exit 1
}