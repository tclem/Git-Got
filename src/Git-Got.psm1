$framework = '4.0'
Set-StrictMode -Version Latest

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
  New-Repository .

#>
function New-Repository($path, [switch] $bare = $false) {
  $resolvedPath = Resolve-Path $path
  [LibGit2Sharp.Repository]::Init($resolvedPath, $bare)
}
