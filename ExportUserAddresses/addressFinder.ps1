# Script to export all users in Active Directory Address to a CSV file
# Script created by Jared Stillwell
# Version: 1.0

#Imports the ActiveDirectory module.
Import-Module ActiveDirectory

Get-ADUser -Filter * -Properties samaccountname, streetaddress, city, st, postalcode | Where { $_.Enabled -eq $True} | Select-Object samaccountname,streetaddress, city, st, postalcode | export-csv .\results.csv -NoTypeInformation