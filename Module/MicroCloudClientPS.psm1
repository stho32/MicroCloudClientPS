<#
    MICRO CLOUD - Client-side API
    
    With this api a client communicates with the micro cloud
#>
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
Add-Type -AssemblyName System.Web

Get-ChildItem -Filter "*.ps1" -Recurse | 
	ForEach-Object {
		. ($_.Fullname)
}

Pop-Location