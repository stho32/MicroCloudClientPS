function Set-MICROVMAlias {
    <#
        .SYNOPSIS
        Set the alias for the vm
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$VmName,
        [string]$Alias
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey
        $VmName = [System.Web.HttpUtility]::UrlEncode($VmName) 
        $Alias = [System.Web.HttpUtility]::UrlEncode($Alias)

        $uri = "http://microcloud:8080/Vm/SetVmAlias?apiKey=$apiKey&VmName=$VmName&Alias=$Alias"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}