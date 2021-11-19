$networkConfig = Get-WmiObject Win32_NetworkAdapterConfiguration -filter "DHCPenabled = 'true'" | where {($_.Description -like "Intel*") -or ($_.Description -like "Ethernet") -or ($_.Description -like "Wireless-AC")}
Set-DnsClientGlobalSetting -SuffixSearchList @()
$networkConfig.SetDnsDomain("domainname")
$networkConfig.SetDynamicDNSRegistration($true,$true)
ipconfig /registerdns