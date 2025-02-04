$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht
$emailid = Get-Content -Path $dir\email.txt

$nimed = @{
    "minunimi" = "keimo"
}

$kuupaevad = @{
    "täna" = Get-Date
}

$nimed
Write-Host ------------------
$emailid
Write-Host ------------------
$kuupaevad
Write-Host ------------------
Write-Host ""
Write-Host Massiivis on
$emailid.Length
Write-Host emaili
Write-Host 
Write-Host Esimene ja viimane Email
$emailid[0], $emailid[29]