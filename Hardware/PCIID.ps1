param ($PNPDeviceID)

Write-Host "[INFO] Extracting PCI Device ID from PNPDeviceID: $PNPDeviceID"

function Get-DeviceID {
    param ($PNPDeviceID)
    if ($PNPDeviceID -match "VEN_8086&DEV_([0-9A-Fa-f]{4})") {
        return $matches[1]
    }
    return $null
}

$pciID = Get-DeviceID -PNPDeviceID $PNPDeviceID

if (-not $pciID) {
    Write-Host "[ERROR] Failed to extract PCI Device ID. Exiting." -ForegroundColor Red
    exit 1
}

Write-Host "[SUCCESS] Extracted PCI Device ID: $pciID" -ForegroundColor Green
return $pciID
