function Add-MICROVM {
    <#
        .SYNOPSIS
        Add a micro-vm to your account
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [ArgumentCompleter({
            param (
                $CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters
            )

            ((Get-MICROImage) | Where-Object Name -like "*$WordToComplete*").Name
        })]
        [ValidateScript({((Get-MICROImage) | Where-Object Name -eq $_)})]
        [string]$BaseImage,
        [ValidateSet(4,8,16,26)]
        [int]$RamInGb = 4
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey

        $uri = "http://microcloud:8080/Vm/New?apiKey=$apiKey&baseImage=$BaseImage&RamInGb=$RamInGb"
        Invoke-RestMethod -Uri $uri -Method Get
    }
}