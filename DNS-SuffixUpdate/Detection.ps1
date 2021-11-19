$networkConfigStatus = Get-WmiObject Win32_NetworkAdapterConfiguration -filter "IPenabled = 'true'" | where {($_.Description -like "Intel*") -or ($_.Description -like "Ethernet") -or ($_.Description -like "Wireless-AC")}
$valid = "TRUE"
for ($i=0; $i -lt $networkConfigStatus.Length; $i++) {
 
    if ($networkConfigStatus[$i].dnsdomain -like "domainname" -and
        $networkConfigStatus[$i].FullDNSRegistrationEnabled -like "True" -and
        $networkConfigStatus[$i].DomainDNSRegistrationEnabled -like "True") {
 
    } else {
        $valid = "FALSE"
    }
}
#if no network adapters are found, report False
if ($networkConfigStatus.Length -eq 0) {
    $valid = "FALSE"
}
 
#if the value is still True, then write an output
if ($valid -like "TRUE"){
    Write-Host "Valid"
}