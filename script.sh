#!/bin/bash

# Detect the USB Bluetooth device
USB_INFO=$(lsusb | grep -i "bluetooth")

# Check if a Bluetooth device was found
if [ -z "$USB_INFO" ]; then
    echo "❌ No Bluetooth USB device found!"
    exit 1
fi

# Extract Vendor ID and Product ID
VENDOR_ID=$(echo $USB_INFO | awk '{print $6}' | cut -d':' -f1)
PRODUCT_ID=$(echo $USB_INFO | awk '{print $6}' | cut -d':' -f2)

echo "🔍 Detected Bluetooth Device: Vendor ID=$VENDOR_ID, Product ID=$PRODUCT_ID"

# Disable USB device
echo "Disabling USB device..."
usb_modeswitch -v $VENDOR_ID -p $PRODUCT_ID -d
if [ $? -ne 0 ]; then
    echo "❌ Failed to disable USB device."
    exit 1
fi
sleep 2

# Re-enable USB device
echo "Re-enabling USB device..."
usb_modeswitch -v $VENDOR_ID -p $PRODUCT_ID -R
if [ $? -ne 0 ]; then
    echo "❌ Failed to reset USB device."
    exit 1
fi
sleep 2

# Reload Bluetooth module
echo "Reloading Bluetooth module..."
modprobe -r btusb && sleep 1 && modprobe btusb
if [ $? -ne 0 ]; then
    echo "❌ Failed to reload Bluetooth module."
    exit 1
fi

echo "✅ Bluetooth device has been reset successfully!"
