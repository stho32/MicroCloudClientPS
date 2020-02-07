function Get-MICROPortForwarding {
    <#
        .SYNOPSIS
        Grabs you a list of port forwardings of the vm
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$name
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey

        $uri = "http://microcloud:8080/PortForwarding?apiKey=$apiKey&name=$name"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}