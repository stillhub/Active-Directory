# Script that imports data from a CSV and sets the department attribute for AD users
# Script created by Jared Stillwell
# Version: 1.0

#Imports the ActiveDirectory module.
Import-Module ActiveDirectory

Import-Csv -Path ".\users.csv" | ForEach-Object {Get-ADUser $_.'samaccountname' | Set-ADUser -Department $_.'department'}