# Script to export email addresses from an Active Directory Group
# Script created by Jared Stillwell
# Version: 1.0

$LogFile = ".\GroupEmailAddresses.csv"

Import-Module ActiveDirectory

$Groups = Get-ADGroup "Group name"

ForEach ($Group in $Groups) {
   Get-ADGroupMember -identity $Group | Get-ADUser -Properties mail | Select-Object Name, mail, enabled | Export-csv $LogFile -Append -NoTypeInformation
}



