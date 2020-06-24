# Create new resource group
New-AzResourceGroup -Name myResourceGroup1 -Location EastUS
# Create VM with name
New-AzVm `
    -ResourceGroupName "myResourceGroup1" `
    -Name "myVM1" `
    -Location "East US" `
    -VirtualNetworkName "myVnet1" `
    -SubnetName "mySubnet1" `
    -SecurityGroupName "myNetworkSecurityGroup1" `
    -PublicIpAddressName "myPublicIpAddress1" `
    -OpenPorts 80,3389
# find IP and print to console
Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup1" | Select "IpAddress"

#Enable-AzVMPSRemoting -Name 'myVM' -ResourceGroupName 'myResourceGroup' -Protocol https -OsType Windows

# Remove resource group to cleanup (commented out as we don't want to do this)
#Remove-AzResourceGroup -Name myResourceGroup1