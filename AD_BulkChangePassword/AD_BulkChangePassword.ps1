
$PasswordReset = Import-csv PasswordReset.csv

foreach($user in $PasswordReset){
    Set-ADAccountPassword -Identity $user.SAM -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "$user.Password" -Force)
    Set-ADUser -ChangePasswordAtLogon $false -Identity $user.SAM
}


ForceChangePasswordOnly