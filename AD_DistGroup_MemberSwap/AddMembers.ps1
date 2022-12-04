# Script that imports a csv file and adds users from members.csv to a group.
# Script created by Jared Stillwell
# Version: 1.0

Import-Module ActiveDirectory

$addtogroup = "groupname"


Import-Csv -Path ".\members.csv" | ForEach-Object {Add-ADGroupMember -Identity $addtogroup -Members $_.'samaccountname'}