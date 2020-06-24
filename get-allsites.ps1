#set mandatory parameter $tenant
param(
    [Parameter(Mandatory)]
    [String]$tenant
)

#connect to SPO
Connect-SPOService ("https://{0}-admin.sharepoint.com" -f $tenant) -Credential (Get-Credential)
# Get sites


Get-SPOSite -Limit All | select Template -unique | out-host

$siteType = Read-Host "Optional template to filter by (or just hit Enter to get all sites)"

$sites = Get-SPOSite -Limit All

# if siteType is not equal to blank then list all sitetypes of that type
if ($siteType -ne "")
{
    $sites = $sites | where { $_.Template -eq $siteType }
}

$sites | select Url, Template | Sort-Object Template, Url

Read-Host -Prompt "Press Enter to exit"