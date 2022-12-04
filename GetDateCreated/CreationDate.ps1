# Script to export creation date of user objects in Active Directory.
# Script created by Jared Stillwell
# Version: 1.0

Import-module ActiveDirectory

$Users = Get-Content -Path ".\users.txt"
$outfile = ".\DateCreated.csv"

function GetExpiry{
        Foreach($USR in $Users){
            Get-ADUser $USR -Properties whenCreated | Select-Object Name, SamAccountName, whencreated | Export-CSV $outfile -NoTypeInformation -Append
        }
    
}

GetExpiry


