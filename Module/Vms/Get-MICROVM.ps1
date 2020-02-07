function Get-MicroVM {
    <#
        .SYNOPSIS
        Requests the list of all running vms for the key
    #>
    [CmdletBinding()]
    param ()
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey

        $uri = "http://microcloud:8080/Vm?apiKey=$apiKey"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}