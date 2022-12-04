# Script to convert Full Names (found in users.txt) to email addresss.
# Script created by Jared Stillwell
# Version: 1.0


Import-module activedirectory

$Usernametxt = Get-Content ".\users.txt"

Foreach ($user in $Usernametxt){Get-ADUser -Filter "Name -eq '$user'" | Get-ADUser -Properties mail | Select-Object mail }