# MicroCloudClientPS
A powershell client module for the microcloud Client API (users perspective)

Essentially you have a [MicroCloud](https://github.com/stho32/MicroCloud) up and running. You are on a developers computer and you need like build services, test environments or stuff like that.

This module provides an easy way to access the cloud through the api provided at port 80 of the entrance router. So you should be able to write scripts like these into your code repositories:

## Example 1: remotebuild.ps
```powershell
# grab yourself a build machine
$buildVm = New-CVM -Image DotNetBuildVS2019 -parameter @{
  repository = "https://github.com/stho32/MicroCloudApi"
  commit = "HEAD"
  stopOnCompletion = $true
}
# wait for the shutdown/destruction of the vm
# it automatically does that since you said "stopOnCompletion"
Wait-CVM -VM $buildVm -ShowLogs -State Death
# while processing the build vm has uploaded some files; download them from the cloud
if ( Test-Path "C:\build_results" ) { Remove-Item "C:\build_results" -Force -Recurse }
Mount-CVMExport -VM $buildVM "C:\build_results\"
# do whatever with the results, e.g. upload them to a deployment pipeline or just install something locally
Expand-Archive "C:\build_results\WebApp_published.zip" "www-publish"
```
