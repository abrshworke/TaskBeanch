param()

$repoRoot = Split-Path -Parent $PSScriptRoot
$examplesDir = Join-Path $repoRoot "examples"

if (-not (Test-Path $examplesDir)) {
  Write-Host "No examples directory found: $examplesDir"
  exit 1
}

$passCount = 0
$failCount = 0
$foundAny = $false

function Invoke-ExampleValidation {
  param(
    [Parameter(Mandatory = $true)]
    [System.IO.DirectoryInfo]$ExampleDir
  )

  $script:foundAny = $true
  $exampleName = "examples/$($ExampleDir.Name)"
  $validateSh = Join-Path $ExampleDir.FullName "validate.sh"
  $validatePs1 = Join-Path $ExampleDir.FullName "validate.ps1"

  if (Test-Path $validatePs1) {
    & $validatePs1 | Out-Null
    if ($LASTEXITCODE -eq 0) {
      Write-Host "PASS: $exampleName"
      $script:passCount++
    } else {
      Write-Host "FAIL: $exampleName"
      $script:failCount++
    }
    return
  }

  if (Test-Path $validateSh) {
    if (Get-Command bash -ErrorAction SilentlyContinue) {
      & bash $validateSh | Out-Null
      if ($LASTEXITCODE -eq 0) {
        Write-Host "PASS: $exampleName"
        $script:passCount++
      } else {
        Write-Host "FAIL: $exampleName"
        $script:failCount++
      }
      return
    }

    Write-Host "FAIL: $exampleName"
    Write-Host "  No bash runtime found"
    $script:failCount++
    return
  }

  Write-Host "FAIL: $exampleName"
  Write-Host "  No validation script found"
  $script:failCount++
}

Get-ChildItem -Path $examplesDir -Directory | Sort-Object Name | ForEach-Object {
  Invoke-ExampleValidation -ExampleDir $_
}

if (-not $foundAny) {
  Write-Host "No example folders found under examples/"
  exit 1
}

Write-Host "Summary: $passCount passed, $failCount failed"

if ($failCount -eq 0) {
  exit 0
}

exit 1
