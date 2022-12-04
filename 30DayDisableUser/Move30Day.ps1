# Script to move AD User Objects from 'Disabled Under 30 Days' OU to 'Disabled' OU
# Script created by Jared Stillwell
# Version: 1.0

$DaysOld = 30
$Date = Get-Date -format ddMMyyyy
$LogOutput = ".\LogOutput_$Date.csv"

$OldDisabled = Get-ADUser -Filter * -SearchBase "OU=Disabled Under 30 Days,OU=Special Objects,OU=Prod,DC=internal,DC=local" -properties LastLogon | Where {([DateTime]::FromFileTime($_.LastLogon)) -lt ((Get-Date).AddDays(-$DaysOld))} 

$OldDisabled | Select-Object Name, @{N='LastLogon'; E={[DateTime]::FromFileTime($_.LastLogon)}} | Export-csv $LogOutput -NoTypeInformation

$OldDisabled | ForEach{Move-ADObject -Identity "$_" -TargetPath "OU=Users,OU=Disabled Objects,DC=internal,DC=local"}