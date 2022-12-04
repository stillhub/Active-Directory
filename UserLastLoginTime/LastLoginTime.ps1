# Script to export user last login times from specific OU
# Script created by Jared Stillwell
# Version: 1.0

$SearchOU = "OU=X,DC=local"

Get-ADUser -Filter * -SearchBase $SearchOU -ResultPageSize 0 -Prop CN,lastLogonTimestamp | Select CN,@{n="lastLogonDate";e={[datetime]::FromFileTime($_.lastLogonTimestamp).ToString('yyyy-MM-dd')}} | Export-CSV -NoType .\UserLastLogin.csv
