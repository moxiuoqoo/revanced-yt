@echo off
:: Set the paths
set PATCHES_FILE=patches-5.9.0.rvp
set INPUT_APK=com.google.android.youtube-19.47.53.apk
set OUTPUT_APK=com.google.android.youtube-19.47.53-patched.apk

:: Patching the APK using ReVanced CLI
echo Patching the APK with selected patches...
.\revanced-cli patch -p %PATCHES_FILE% -e "Unlock premium" -e "GmsCore support" -e "Bypass image region restrictions" -e "Disable resuming Shorts on startup" -e "Theme" -e "SponsorBlock" -e "Spoof app version" -e "Return YouTube Dislike" -e "Hide Shorts components" .\%INPUT_APK%

:: Check if the APK is patched
if exist .\%OUTPUT_APK% (
    echo APK has been patched successfully.
    echo Output saved to: %OUTPUT_APK%
) else (
    echo Failed to patch the APK.
)

pause