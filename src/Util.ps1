$framework = '4.0'
Set-StrictMode -Version Latest

function Find-DominatingFile($path, $target) {
  $currentPath = Resolve-Path $path
  while (![string]::IsNullOrEmpty($currentPath)) {
    $combinedPath = [io.Path]::Combine($currentPath, $target)
    if (Test-Path $combinedPath) {
      return $combinedPath
    }

    $currentPath = [io.Path]::GetDirectoryName($currentPath)
  }

  return $null
}

function Find-GitPath($startingPath = '.') {
  Find-DominatingFile $startingPath '.git'
}
