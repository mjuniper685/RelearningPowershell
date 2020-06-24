#connect to SPO
Connect-SPOService -URL "https://tenant-admin.sharepoint.com/"

#Test connection
Try {
    $TestSPO = Get-SPOTenant }
Catch
    { Write-Host "Error accessing SharePoint Online - please connect to the service before retrying"; break }

#Get all sites
Get-SPOSite -Limit All
#Site name and config
$Owner = ""
$SiteName = ""
$URL = "https://tenant.sharepoint.com/sites/TestPowerShell"
Try {
    New-SPOSite -URL $URL -Owner $Owner  -StorageQuota 200 -Title $SiteName
}
Catch [Exception]
{
    echo $_.Exception.GetType().FullName, $_.Exception.Message
}
 
#Create site
Get-SPOSite -Limit All
#Log success?