$framework = '4.0'
Set-StrictMode -Version Latest

properties {
  $solutionDir = Resolve-Path .
  $toolsDir = "$solutionDir\tools"
  $nuget = "$toolsDir\nuget.exe"
}

task default -depends package

task ? -Description "Helper to display task info" {
    Write-Documentation
}

task package {
  exec { & $nuget pack Git-Got.nuspec }
}
