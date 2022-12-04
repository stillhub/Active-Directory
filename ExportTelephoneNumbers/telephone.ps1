# Script to imports a csv file with names (Display names) and exports a list of telephone numbers assigned.
# Script created by Jared Stillwell
# Version: 1.0

import-module ActiveDirectory

$CSVImport = Import-Csv -Path ".\NoDDI.csv"

ForEach($UserLine in $CSVImport){
    $UserString = $UserLine.Name
    Get-ADUser -Filter {displayName -Like $UserString} -properties Telephonenumber | Select-Object name,telephonenumber | Export-Csv ".\NumberBackup.csv" -Append
}

Write-host "done"
sleep 30