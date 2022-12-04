# Script that exports computer names inside an OU
# Script created by Jared Stillwell
# Version: 1.0

$OUpath = 'OU=Servers,DC=example,DC=local'
$ExportPath = '.\computers_in_ou.csv'
Get-ADComputer -Filter * -SearchBase $OUpath | Select-object DistinguishedName,DNSHostName,Name | Export-Csv -NoType $ExportPath