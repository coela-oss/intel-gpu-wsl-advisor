param ($pciID)

$tsvFilePath = ".\Hardware\supported_hardware_table.tsv"

Write-Host "[INFO] Loading GPU compatibility data from: $tsvFilePath"

if (-Not (Test-Path $tsvFilePath)) {
    Write-Host "[ERROR] GPU data file not found. Please check the path. Exiting." -ForegroundColor Red
    exit 1
}

# Import TSV file as an array of objects
$gpuData = Import-Csv -Path $tsvFilePath -Delimiter "`t"

Write-Host "[INFO] Searching for a matching GPU with PCI ID: $pciID"

# Find matching GPU from TSV file
$matchedGPU = $gpuData | Where-Object {
    $_."PCI IDs" -split ", " -contains $pciID
}

if (-not $matchedGPU) {
    Write-Host "[ERROR] No matching GPU found for PCI ID: $pciID. Exiting." -ForegroundColor Red
    exit 1
}

Write-Host "[SUCCESS] Found matching GPU: $($matchedGPU.Name) (Architecture: $($matchedGPU.Architecture))" -ForegroundColor Green
return $matchedGPU
