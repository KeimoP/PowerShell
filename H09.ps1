$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

$csv_header | Set-Content $dir\H9.csv

$users = Import-Csv $dir\users.csv

ForEach($user in $users){
    $lname = $user.last_name
    $fname = $user.first_name
    $nimi = $fname+" "+$lname
    $kasutajanimi = $fname.Substring(0, [math]::Min($lname.Length, 1)) + $lname

    $pass = $fname.Substring(0, [math]::Min($lname.Length, 3))
    # $pass = -join $fname[$pass]
    $pass += Get-Random -Maximum 99 -Minimum 10

    $row = $nimi+";"+$kasutajanimi+";"+$fname.ToLower()+"."+$lname.ToLower()+"@hkhk.edu.ee;"+$pass
    Add-Content $dir\H9.csv $row
}