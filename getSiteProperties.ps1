# gets properties for a site collection by passing in the site collection url

# creates a mandatory parameter of siteUrl
param(
    [Parameter(Mandatory)]
    [String]$siteUrl
)

Connect-SPOService ("{0}-admin.sharepoint.com" -f ($siteUrl.Substring(0, $siteUrl.IndexOf(".sharepoint.com")))) -Credential (Get-Credential)

Get-SPOSite $siteUrl | select *

# read command line input to exit
Read-Host -Prompt "Press enter to exit"