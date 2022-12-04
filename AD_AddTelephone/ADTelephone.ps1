# Script that imports telephone numbers and Active Directory users from a CSV and sets the number.
# Script created by Jared Stillwell
# Version: 1.0

Import-module ActiveDirectory

$CSVImport = "./DDI.csv"

ForEach($UserLine in $CSVImport){

    Set-ADUser -Filter {displayName -Like $UserLine.Name} -Properties telephonenumber -Add @{telephonenumber=$UserLine.Telephone}

}