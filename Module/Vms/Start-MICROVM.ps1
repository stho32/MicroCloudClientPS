function Start-MICROVM {
    <#
        .SYNOPSIS
        Requests a start for the MicroVM
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$VmName
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey
        $VmName = [System.Web.HttpUtility]::UrlEncode($VmName) 

        $uri = "http://microcloud:8080/Vm/Start?apiKey=$apiKey&VmName=$VmName&Alias=$Alias"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}