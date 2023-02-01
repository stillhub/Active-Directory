Get-ADUser -Filter * -Properties ScriptPath | export-csv C:\scripts\export\CurrentMappingsUsers.csv -NoTypeInformation
