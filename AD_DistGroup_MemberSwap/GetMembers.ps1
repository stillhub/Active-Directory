# Script that exports a list of Active Directory users a part of a group.
# Script created by Jared Stillwell
# Version: 1.0

#Imports the ActiveDirectory module.
Import-Module ActiveDirectory

$group = "groupname"

Get-ADGroupMember -Identity $group | Export-csv members.csv -NoTypeInformation