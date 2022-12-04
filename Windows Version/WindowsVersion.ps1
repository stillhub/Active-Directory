# Script to show OS of Active Directory computer objects

Get-ADComputer -Filter 'enabled -eq "true"' `
-Properties Name,Operatingsystem,OperatingSystemVersion,IPv4Address |
Sort-Object -Property Operatingsystem |
Select-Object -Property Name,Operatingsystem,OperatingSystemVersion,IPv4Address |
Out-GridView