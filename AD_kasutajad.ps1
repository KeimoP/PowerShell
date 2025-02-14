$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

$users = Import-Csv $dir\AD_Kasutajad.csv

ForEach($user in $users){
    $lname = $user.Perekonnanimi
    $fname = $user.Eesnimi
    $osakond = $user.Osakond
    $samnimi = $fname+"."+$lname
    $printsnimi = $fname+"."+$lname+"@PLAAS.LOCAL".ToLower()
    $nimi = $fname+" "+$lname
    $kasutajanimi = $fname.Substring(0, [math]::Min($lname.Length, 1)) + $lname
    $email = $fname.Substring(0, [math]::Min($lname.Length, 1)).ToLower()+"."+$lname.ToLower()+"@plaas.local"
    $pass = "Cool2Pass!"

    try {

        Get-ADOrganizationalUnit -Identity "OU=$osakond, OU=KASUTAJAD, DC=PLAAS,DC=LOCAL" | Out-Null
    }

    catch

        [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {

        New-ADOrganizationalUnit -Name $osakond -Path "OU=KASUTAJAD,DC=PLAAS,DC=LOCAL"    
    }


    If ((Get-ADUser -Filter {Name -eq $nimi }) -eq $Null)
	
        {
            $Password = (ConvertTo-SecureString -String "$pass" -AsPlainText -Force)
            New-ADUser -Name $nimi -DisplayName $nimi -GivenName $fname -Surname $lname -UserPrincipalName $printsnimi -SamAccountName $samnimi -EmailAddress $email -Path "OU=$osakond, OU=KASUTAJAD, DC=PLAAS, DC=LOCAL" -AccountPassword($Password) -PasswordNeverExpires $true -Enabled $true
        }
    Else
        {
            Write-Host "$nimi juba olemas"
        }
}
