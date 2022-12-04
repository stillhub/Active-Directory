# Script to export SAM account names from Active Directory Group
# Script created by Jared Stillwell
# Version: 1.0

$ADGroup = "AD GROUP"

import-module activedirectory

Get-ADGroupMember -identity $ADGroup | select SamAccountName | Export-csv -path ".\GroupSAM.csv" -NoTypeInformation