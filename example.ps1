



$vm = Add-MICROVM -BaseImage VS2019-Image
Get-MICROVM | ft

Get-MICROPortForwarding -name $vm.Name


#$vm.Name



Remove-MICROVM $vm.Name