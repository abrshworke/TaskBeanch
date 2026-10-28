param()

$pythonBin = $env:PYTHON_BIN
if ([string]::IsNullOrWhiteSpace($pythonBin)) {
  $pythonBin = "python"
}

& $pythonBin -m unittest discover -s tests -p "test_*.py" -v
if ($LASTEXITCODE -eq 0) {
  Write-Host "PASS: python_bugfix"
  exit 0
}

Write-Host "FAIL: python_bugfix"
exit $LASTEXITCODE

