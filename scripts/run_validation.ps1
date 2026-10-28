param(
  [Parameter(Mandatory = $true)]
  [string]$ExampleFolder
)

$repoRoot = Split-Path -Parent $PSScriptRoot
if ([System.IO.Path]::IsPathRooted($ExampleFolder)) {
  $examplePath = $ExampleFolder
} else {
  $examplePath = Join-Path $repoRoot $ExampleFolder
}

if (-not (Test-Path $examplePath)) {
  Write-Host "FAIL: example folder not found: $ExampleFolder"
  exit 1
}

$validateSh = Join-Path $examplePath "validate.sh"
$validatePs1 = Join-Path $examplePath "validate.ps1"

if (Test-Path $validateSh) {
  & bash $validateSh
  if ($LASTEXITCODE -eq 0) {
    Write-Host "PASS: $ExampleFolder"
    exit 0
  }
  Write-Host "FAIL: $ExampleFolder"
  exit $LASTEXITCODE
}

if (Test-Path $validatePs1) {
  & pwsh -File $validatePs1
  if ($LASTEXITCODE -eq 0) {
    Write-Host "PASS: $ExampleFolder"
    exit 0
  }
  Write-Host "FAIL: $ExampleFolder"
  exit $LASTEXITCODE
}

Write-Host "FAIL: no validation script found in $ExampleFolder"
exit 1

