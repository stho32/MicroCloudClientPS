function Remove-MICROVM {
    <#
        .SYNOPSIS
        Remove a micro-vm from your account
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Name
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey

        $uri = "http://microcloud:8080/Vm/RemoveVm?apiKey=$apiKey&vmName=$Name"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}