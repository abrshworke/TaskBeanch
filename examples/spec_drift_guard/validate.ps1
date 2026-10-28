param()

$pythonBin = $env:PYTHON_BIN
if ([string]::IsNullOrWhiteSpace($pythonBin)) {
  $pythonBin = "python"
}

& $pythonBin -m unittest discover -s tests -p "test_*.py" -v
if ($LASTEXITCODE -eq 0) {
  Write-Host "PASS: spec_drift_guard"
  exit 0
}

Write-Host "FAIL: spec_drift_guard"
exit $LASTEXITCODE

