# Script to move AD User Object to another OU, changes the primary group and remove 'Domain Users'
# Script created by Jared Stillwell
# Version: 1.0

$groupname = "GROUP NAME"
$OU = "OU=EXAMPLE,OU=local"

$ADUsersInput = ".\Users.txt"
$ADUsers = Get-Content $ADUsersInput
$group = get-adgroup "GROUPNAME" -properties @("primaryGroupToken")

function MoveUsers{
    foreach($USR in $ADUsers){
        $User = Get-ADUser -Identity $USR
        Add-ADGroupMember -Identity $groupname -Members $User -Confirm:$False
        Move-ADObject -Identity $User -TargetPath $OU -Confirm:$False
        $User | set-aduser -replace @{primaryGroupID=$group.primaryGroupToken}
        Remove-ADGroupMember -Identity "Domain Users" -Members $User -Confirm:$False
    }
}

MoveUsers




