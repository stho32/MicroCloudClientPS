function Add-MICROVM {
    <#
        .SYNOPSIS
        Add a micro-vm to your account
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet("VS2019-Image", "Windows-10-Pro-MicroCloud-Image")]
        [string]$BaseImage
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey

        $uri = "http://microcloud:8080/Vm/New?apiKey=$apiKey&baseImage=$BaseImage"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}