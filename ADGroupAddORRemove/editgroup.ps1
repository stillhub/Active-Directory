<#
    .SYNOPSIS
        Adds and removes AD groups based on a CSV file
    .DESCRIPTION
        Adds and removes Active Directory groups based on 
        a CSV file. This is made for bulk group changes
        in Service Now.
    .NOTES
        Created by Jared Stillwell on 4/2/21
        Confirm 'Current' does not have any space afterwards
#>

#Gets current date and time for log creation.
$LogDate = get-date -format "d.MM.yy.HH.mm"

#Executes and saves log to location.
Start-Transcript -Path ".\GroupChange_$LogDate.log"

#Imports the ActiveDirectory module.
Import-Module ActiveDirectory

#Adds member (samaccountname) from group (Replace) column.
function AddGroup{
    Import-Csv -Path ".\UserMembers.csv" | ForEach-Object {Add-ADGroupMember -Identity $_.'Add' -Members $_.'samaccountname'}
}

#Removes member (samaccountname) from group (current) column.
function RemoveGroup{
    Import-Csv -Path ".\UserMembers.csv" | ForEach-Object {Remove-ADGroupMember -Identity $_.'Remove' -Members $_.'samaccountname' -Confirm:$false}
}

#Executes functions
AddGroup
RemoveGroup

#Stops and saves log file.
Stop-Transcript
Sleep 15
