$framework = '4.0'
Set-StrictMode -Version Latest

. .\Util.ps1

<#
.Synopsis
Create a new git repository

.Description
Initializes a new git repository at the specified path. Equivalent to "git init"

.Parameter Path
The path to initialize the repository in

.Parameter Bare
If true, creates a bare repository. Equivalent to the --bare argument to git.

.Example

  # Create a new repository in the current directory
  > New-Repository .

#>
function New-Repository($path, [switch] $bare = $false) {
  $resolvedPath = Resolve-Path $path
  [LibGit2Sharp.Repository]::Init($resolvedPath, $bare)
}

<#
.Synopsis
Creates a new repository object

.Description
Creates a new git repository object, which you can manipulate

.Parameter Path
The path to the repository

.Example

  # Get the repository
  > $repository = Get-Repository path/to/my/project
#>
function Get-Repository($path) {
  $gitPath = Find-GitPath $path
  New-Object LibGit2Sharp.Repository($gitPath)
}

<#
.Synopsis
Gets the branches in the current repository

.Parameter Path
The path to start in. Defaults to '.'.

.Example

  # Get the branches
  > Get-Branches
#>
function Get-Branches($path = '.') {
  $repository = Get-Repository $path
  $repository.Branches
}

<#
.Synopsis
Gets the commits from the current HEAD back

.Parameter Path
The path to start in. Defaults to '.'.

.Example

  > Get-Commits
#>
function Get-Commits($path = '.') {
  $repository = Get-Repository $path
  $repository.Commits  
}

