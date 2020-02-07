<#
    MICRO CLOUD - Client-side API
    
    With this api a client communicates with the micro cloud
#>
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

Get-ChildItem -Filter "*.ps1" -Recurse | 
	ForEach-Object {
		. ($_.Fullname)
}

Pop-Location