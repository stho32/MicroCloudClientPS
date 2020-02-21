function Add-MICROVM {
    <#
        .SYNOPSIS
        Add a micro-vm to your account
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet("VS2019-Image", "Windows-10-Pro-MicroCloud-Image", "Basis-Windows-Server-2019-Image")]
        [string]$BaseImage,
        [ValidateSet(4,8,16)]
        [int]$RamInGb = 4
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey

        $uri = "http://microcloud:8080/Vm/New?apiKey=$apiKey&baseImage=$BaseImage&RamInGb=$RamInGb"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}