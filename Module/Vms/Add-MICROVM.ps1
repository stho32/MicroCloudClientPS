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
        [int]$RamInGb = 4,
        [Switch]$WaitForPortForwardings
    )
    
    process {
        $apiKey = $global:MICROCLOUD_ApiKey

        $uri = "http://microcloud:8080/Vm/New?apiKey=$apiKey&baseImage=$BaseImage&RamInGb=$RamInGb"
        $vmAdded = Invoke-RestMethod -Uri $uri -Method Get

        if ($WaitForPortForwardings) {
            $start = Get-Date
            Write-Host "Waiting for vm to open ports" -NoNewline
            $vm = $vmAdded
            while (-not ([bool]$vm.PortForwardings))
            {
                Write-Host "." -NoNewline
                Start-Sleep -Seconds 2
                $vm = (Get-MICROVm) | Where-Object Name -eq $vmAdded.Name
            }
            
            $durationInSeconds = ((Get-Date) - $start).TotalSeconds
            Write-Host ""
            Write-Host "You have waited for $durationInSeconds seconds, sorry it took us so long. You may now enter the VM."
            $vmAdded = $vm
        }
        $vmAdded
    }
}