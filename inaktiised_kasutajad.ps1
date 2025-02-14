Import-Module ActiveDirectory

$targetOU = "OU=INAKTIIVSED, OU=KASUTAJAD, DC=PLAAS, DC=LOCAL"

$cutoffdate = (Get-Date).AddDays(-365)

$users = Get-ADUser -Filter {Enabled -eq $true} -Properties LastLogonDate, DistinguishedName

foreach ($user in $users) {
    if ($user.LastLogonDate -lt $cutoffdate -or $user.LastLogonDate -eq $null){
        Disable-ADAccount $user.SamAccountName
        Move-ADObject -Identity $user.DistinguishedName -TargetPath $targetOU
        Write-Host "Liigutatud: $($user.SamAccountName) $targetOU -sse"
    }
}