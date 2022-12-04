# Script that imports a csv file with samaccountnames and exports last logon date and expiration dates.
# Script created by Jared Stillwell
# Version: 1.0

$directory = Import-Csv -Path .\users.csv

foreach($UserLine in $directory){
    $SAM = $UserLine.SAM
    Write-Host 
    Get-ADUser -Identity $SAM -Properties *  | select SAMAccountName,LastLogonDate, AccountExpirationDate | Export-CSV .\LastLogin_Expiry.csv -Append -NoTypeInformation
}
