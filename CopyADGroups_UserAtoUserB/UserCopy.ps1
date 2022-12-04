# Script to copy group memberships from UserA to UserB
# Script created by Jared Stillwell
# Version: 1.0

Import-Module ActiveDirectory
Get-ADUser -Identity UserA -Properties memberof | Select-Object -ExpandProperty memberof |  Add-ADGroupMember -Members UserB