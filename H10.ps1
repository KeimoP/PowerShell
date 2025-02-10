$xml = [xml](Get-Content C:\Users\Administrator\Documents\GitHub\PowerShell\customers.xml)
$rows = $xml.customers.customer
foreach ($row in $rows)
{
    if($row.country -contains "Poland"){
        $row.full_name
    }
}