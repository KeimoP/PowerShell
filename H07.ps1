$env:COMPUTERNAME

$kettad = Get-PhysicalDisk
Write-Host 
Write-Host Sellel arvutil on 
$kettad.length
Write-Host ketast
Write-Host 
Write-Host 
Write-Host Ketastel on vaba ruumi:
$drives = Get-PSDrive -PSProvider FileSystem

foreach($drive in $drives){
    $totalsize = $drive.Used + $drive.Free
    $freePercent = ($drive.Free / $totalsize) * 100

    Write-Output("Ketas {0}: {1:N2}% vaba" -f $drive.Root, $freePercent)

    if ($freePercent -lt 50) {
        Write-Output "Hakkab täis saama!"
        Write-Output " "
    }
}
