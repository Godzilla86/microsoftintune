$RegistryPath = "HKLM:\SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown"
$Name = "bDisableJavaScript"
$Value = 1

New-Item -Path $RegistryPath -Force | Out-Null

New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null