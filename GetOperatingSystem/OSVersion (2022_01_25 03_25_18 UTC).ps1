function global:Get-OSInfo
{
  param([string]$computer)

    [string] $strReturn = '' 

    if([string]::IsNullOrEmpty($computer) -eq $false)
    {   
        # Create the connection to Active directory.
        $dom = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
        $root = $dom.GetDirectoryEntry()
        $search = [System.DirectoryServices.DirectorySearcher]$root

        # Search the directory for our user.
        $search.Filter = "(&(objectclass=Computer)(sAMAccountName=$computer$))"
        $result = $search.FindOne()

        if ($result -ne $null)
        {
            $system = $result.GetDirectoryEntry()
            $strReturn = $system.Properties["operatingSystem"]
        }
    }

    return $strReturn
}

$hostname = Get-Content .\Servers.txt

    foreach($hosts in $hostname){
    Get-OSInfo $hosts

}