#!/bin/bash

# Set the paths
PATCHES_FILE="patches-5.9.0.rvp"
INPUT_APK="com.google.android.youtube-19.47.53.apk"
OUTPUT_APK="com.google.android.youtube-19.47.53-patched.apk"

# Patching the APK using ReVanced CLI
echo "Patching the APK with selected patches..."
./revanced-cli patch -p "$PATCHES_FILE" -e "Unlock premium" -e "GmsCore support" -e "Bypass image region restrictions" -e "Disable resuming Shorts on startup" -e "Theme" -e "SponsorBlock" -e "Spoof app version" -e "Return YouTube Dislike" -e "Hide Shorts components" "./$INPUT_APK"

# Check if the APK is patched
if [ -f "./$OUTPUT_APK" ]; then
    echo "APK has been patched successfully."
    echo "Output saved to: $OUTPUT_APK"
else
    echo "Failed to patch the APK."
fi

read -p "Press Enter to continue..."
