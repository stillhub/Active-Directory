# Script that adds (addADGroup.txt) or removes (removeADGroup.txt) groups from AD users (users.txt).
# Script created by Jared Stillwell
# Version: 1.0

Import-module ActiveDirectory


$AddADGroup = ".\addADGroup.txt"
$RemoveADGroup = ".\removeADGroup.txt"
$Users = Get-Content -Path ".\users.txt"

function AddGroups{
    $AddGroups = Get-Content -Path $AddADGroup
    Foreach($ADGroups in $AddGroups){
        Foreach($USR in $Users){
            Add-ADGroupMember -Identity $ADGroups -Members $USR -Confirm:$False
        }
    }
}

function RemoveGroups{
    $RemoveGroups = Get-Content -Path $RemoveADGroup
    Foreach($ADGroups in $RemoveGroups){
        Foreach($USR in $Users){
            Remove-ADGroupMember -Identity $ADGroups -Members $USR -Confirm:$False
        }
    }
}

#AddGroups
RemoveGroups