function Get-MICROImage {
    <#
        .SYNOPSIS
        lists all available images
    #>
    [CmdletBinding()]
    param (
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey

        $uri = "http://microcloud:8080/Image?apiKey=$apiKey"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}