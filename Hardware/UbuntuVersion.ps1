param ($kernelVersion)

Write-Host "[INFO] Evaluating recommended Ubuntu WSL version for Kernel version: $kernelVersion"

function Get-UbuntuVersion {
    param ($kernelVersion)

    if ($kernelVersion -ge 6.12) {
        Write-Host "[INFO] Kernel version is 6.12 or higher. Ubuntu 24.10 (Oracular) is recommended."
        return "Ubuntu-24.10"
    } elseif ($kernelVersion -ge 6.8) {
        Write-Host "[INFO] Kernel version is between 6.8 and 6.11. Ubuntu 24.04 (Noble) is recommended."
        return "Ubuntu-24.04"
    } elseif ($kernelVersion -ge 5.15) {
        Write-Host "[INFO] Kernel version is between 5.15 and 6.7. Ubuntu 22.04 (Jammy) is recommended."
        return "Ubuntu-22.04"
    } elseif ($kernelVersion -ge 5.10) {
        Write-Host "[INFO] Kernel version is between 5.10 and 5.14. Ubuntu 20.04 (Focal) is recommended."
        return "Ubuntu-20.04"
    } else {
        Write-Host "[WARNING] Kernel version is below 5.10. No supported Ubuntu version found for WSL installation." -ForegroundColor Yellow
        return "None"
    }
}

$ubuntuVersion = Get-UbuntuVersion -kernelVersion $kernelVersion

if (-not $kernelVersion) {
    Write-Host "[WARNING] Recommended Ubuntu WSL Version Not Find.." -ForegroundColor Yellow
} else {
    Write-Host "[Success] Recommended Ubuntu WSL Version: $ubuntuVersion" -ForegroundColor Green
}
return $ubuntuVersion
