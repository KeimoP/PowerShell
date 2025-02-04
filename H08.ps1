function Ringipindala {
    param (
        [double]$Raadius
    )
       
    $pindala = [math]::PI * [math]::Pow($Raadius,2)
    Write-Output ("Ringi pindala raadiusega {0} on {1:N2}" -f $Raadius, $pindala)
}
Ringipindala -Raadius 5