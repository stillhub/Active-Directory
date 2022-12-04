# Script to create Active Directory users in bulk using a CSV file.
# Script created by Jared Stillwell
# Version: 1.0

Import-Module ActiveDirectory
$Users = Import-Csv -Delimiter "," -Path ".\Userlist.csv"            
foreach ($User in $Users)            
{            
    $Displayname = $User.Firstname + " " + $User.Lastname            
    $UserFirstname = $User.Firstname            
    $UserLastname = $User.Lastname            
    $OU = $User.OU           
    $SAM = $User.SAM            
    $UPN = $User.Firstname + "." + $User.Lastname + "@" + $User.Maildomain
    $Email = $User.Email
    $Description = $User.Description            
    $Password = $User.Password   
    $Manager = $User.Manager  
    $Mobile = $User.Mobile
    $Title = $User.Title   
    New-ADUser -Name "$Displayname" -EmailAddress "$Email" -Manager "$Manager" -Title "$Title" -MobilePhone "$Mobile" -DisplayName "$Displayname" -SamAccountName $SAM -UserPrincipalName $UPN -GivenName "$UserFirstname" -Surname "$UserLastname" -Description "$Description" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path "$OU" -ChangePasswordAtLogon $false –PasswordNeverExpires $true
}