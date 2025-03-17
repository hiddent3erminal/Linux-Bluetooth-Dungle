# 🔄 Bluetooth Reset Script

A **Bash script** to **automatically detect and reset** a USB Bluetooth device on Linux.  
No need to manually enter **Vendor ID** and **Product ID**—the script finds them automatically! 🎯  

## 📌 Features
✅ **Auto-detects** the USB Bluetooth device using `lsusb`  
✅ **Resets** the device with `usb_modeswitch`  
✅ **Reloads** the Bluetooth kernel module (`btusb`)  
✅ **No manual configuration needed**  
✅ **Error handling** to ensure smooth execution  

## 🛠️ Installation & Usage

### 🔹 1. Clone the Repository
```bash
git clone https://github.com/your-username/Bluetooth-Reset-Script.git
cd Bluetooth-Reset-Script
chmod +x script.sh
sudo ./script.sh

### 🔹 Dependencies 
sudo apt install usbutils usb-modeswitch

Please give star if it was helpful for you. 

