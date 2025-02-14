#!/bin/sh

# Set environment variables
INPUT_APK="/path/to/com.google.android.apps.youtube.music_7.29.52-arm64-v8a-revanced.apk"
OUTPUT_DIR="/revanced-patching/revaned-cli/revanced-cli/build/distributions/revanced-cli-5.0.0/revanced-cli-5.0.0/bin/apk-output"
PATCHES_FILE="/path/to/patches-5.10.0.rvp"

# Run the patching command
revanced-cli patch --patches "$PATCHES_FILE" -o "$OUTPUT_DIR" -e "Hide 'Get Music Premium' label" -e "Remove upgrade button" -e "Bypass certificate checks" -e "Remove background playback restrictions" -e "Hide music video ads" -e "GmsCore support" -e "Spoof client" "$INPUT_APK"

# Keep the terminal open after execution
read -p "Press Enter to continue..."