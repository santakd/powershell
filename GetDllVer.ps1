################################################################################
# Name:         GetDllVer.ps1
# Description:  Prints out DLL version
# Usage:        GetDllVer.ps1 <path to DLL>
# C:\>powershell -ExecutionPolicy bypass -File C:\GetDllVer.ps1 "test.dll"
################################################################################
param(
    [string]$DLL
)
 
if (!(Test-Path $DLL)) {
    throw "File '{0}' does not exist" -f $DLL
}
 
try {
    $version =
        Get-ChildItem $DLL | Select-Object -ExpandProperty VersionInfo |
            Select-Object FileVersion | Select-Object -ExpandProperty FileVersion
 
    return $DLL + " - ver: " + $version
} catch {
    throw "Failed to get DLL file version: {0}." -f $_
}