# **Intel GPU Compatibility & WSL Setup for AI Inference**
  
This repository provides **PowerShell scripts** to detect **Intel GPUs**, check compatibility, and guide users through installing **Ubuntu on WSL** for AI inference workloads. It is specifically designed for **AI developers** who want to leverage their **Intel GPU** for deep learning and inference tasks.

---

## **Features**
✅ **Automatic Intel GPU detection**  
✅ **PCI Device ID extraction**  
✅ **Kernel version compatibility check**  
✅ **Recommended Ubuntu version for AI workloads**  
✅ **Guided WSL installation process**  

---

## **Requirements**
🔹 **Intel GPU** (Integrated or Dedicated, e.g., Intel Arc, Iris Xe, UHD Graphics)  
🔹 **Windows 10 / 11 with WSL support**  
🔹 **PowerShell** (Run as Administrator for WSL installation)  
🔹 **Supported Linux Kernel Version** (for GPU compatibility)  

---

## **Installation**
1️⃣ **Clone the repository**  
```powershell
git clone https://github.com/your-repo/intel-gpu-wsl-setup.git
cd intel-gpu-wsl-setup
```

2️⃣ **Run the script in PowerShell**  
```powershell
.\WhichVersionInstall.ps1
```

3️⃣ **Follow the prompts**  
- The script will detect your Intel GPU.  
- It will check if your GPU is **compatible** with AI workloads.  
- If compatible, it will **recommend an Ubuntu WSL version** for installation.  
- You will be asked to confirm the **WSL installation** process.  

---

## **Supported Intel GPUs**
This script checks compatibility based on a **hardware table (`supported_hardware_table.tsv`)**, which includes:

- **Intel Arc Series**
- **Intel Iris Xe Graphics**
- **Intel UHD Graphics**
- **Intel Data Center GPUs**

> If your GPU is **not listed**, the script will notify you and **exit safely**.

---

## **Ubuntu Version Recommendation**
| **Kernel Version** | **Recommended Ubuntu WSL Version** |
|--------------------|----------------------------------|
| 6.12+             | Ubuntu 24.10 (Oracular)         |
| 6.8 - 6.11        | Ubuntu 24.04 (Noble)           |
| 5.15 - 6.7        | Ubuntu 22.04 (Jammy)           |
| 5.10 - 5.14       | Ubuntu 20.04 (Focal)           |
| Below 5.10        | ❌ **Not Supported**            |

> **Note:** These recommendations are based on **Intel GPU driver compatibility** for AI workloads.

---

## **How It Works**
### **Step 1: Detect Intel GPU**
- Uses `Get-WmiObject Win32_VideoController` to find **Intel GPUs**.
- Extracts **PCI Device ID** for hardware identification.

### **Step 2: Match GPU Compatibility**
- Reads **`supported_hardware_table.tsv`** to check if your GPU is listed.
- Identifies **Linux Kernel requirements**.

### **Step 3: Recommend Ubuntu WSL Version**
- Compares **Kernel version** and suggests an **Ubuntu version**.

### **Step 4: Confirm & Install WSL**
- Prompts the user to install the **recommended Ubuntu version**.
- Runs `wsl --install` for a smooth **installation**.

---

## **Example Output**
```powershell
[INFO] Starting GPU detection and compatibility check...
[INFO] Detected Intel GPU: Intel Arc A770
[INFO] PCI Device ID: 56A8
[INFO] Matched GPU Model: Intel Arc A770
[INFO] Required Linux Kernel Version: 6.8
[INFO] Recommended Ubuntu WSL Version: Ubuntu 24.04 (Noble)

[USER INPUT] Would you like to install Ubuntu WSL now? (Y/N)
```

---

## **Troubleshooting**
🛠 **GPU Not Found?**  
Ensure you have an **Intel GPU driver installed** and update Windows.

🛠 **WSL Installation Fails?**  
Run PowerShell as **Administrator** and check if WSL is enabled:  
```powershell
wsl --list --verbose
```

🛠 **Ubuntu Version Not Found?**  
You can manually install using:
```powershell
wsl --install -d Ubuntu-22.04
```

---

## **Contributing**
We welcome contributions!  
🔹 Add support for new Intel GPUs  
🔹 Improve compatibility checking  
🔹 Enhance error handling  

---

## **License**
📜 **MIT License** - Free to use and modify.

---

## **Future Plans**
✅ Add **Intel OpenVINO support** for AI inference  
✅ Auto-detect **WSL2 + GPU drivers**  
✅ Support for **other AI accelerators**  

---

🚀 **Get Started with AI Inference on Intel GPUs Now!** 🚀
