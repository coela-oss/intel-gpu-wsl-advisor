Write-Host "[INFO] Retrieving Intel GPU information..."

# Retrieve Intel GPU information using WMI
$gpuList = Get-WmiObject Win32_VideoController | Where-Object { $_.AdapterCompatibility -match "Intel" }

if (-not $gpuList) {
    Write-Host "[ERROR] No Intel GPU detected. Exiting." -ForegroundColor Red
    exit 1
}

# Select the first valid Intel GPU entry
$gpu = $gpuList | Select-Object -First 1

Write-Host "[SUCCESS] Intel GPU detected: $($gpu.Name)" -ForegroundColor Green
return $gpu