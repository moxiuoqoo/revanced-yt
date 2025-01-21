@echo off
:: Set the paths
set PATCHES_FILE=patches-5.9.0.rvp
set INPUT_APK=com.google.android.youtube-19.47.53.apk
set OUTPUT_APK=com.google.android.youtube-19.47.53-patched-magisk.apk
set MODULE_DIR=Patched_YouTube_Module

:: Patching the APK using ReVanced CLI
echo Patching the APK with selected patches...
.\revanced-cli patch -p %PATCHES_FILE% -e "Unlock premium" -e "Bypass image region restrictions" -e "Disable resuming Shorts on startup" -e "Theme" -e "SponsorBlock" -e "Spoof app version" -e "Return YouTube Dislike" -e "Hide Shorts components" .\%INPUT_APK%

:: Check if the APK is patched
if exist .\%OUTPUT_APK% (
    echo APK has been patched successfully.
    echo Output saved to: %OUTPUT_APK%
) else (
    echo Failed to patch the APK.
    exit /b
)

:: Create the Magisk Module folder structure
echo Creating Magisk module structure...
mkdir %MODULE_DIR%\META-INF\com\google\android
mkdir %MODULE_DIR%\system\app\YouTube

:: Move patched APK to Magisk module folder
echo Moving patched APK to module directory...
move .\%OUTPUT_APK% %MODULE_DIR%\system\app\YouTube\com.google.android.youtube-19.47.53-patched-magisk.apk

:: Create module.prop file
echo Creating module.prop file...
echo id=patched_youtube_19.47.53 > %MODULE_DIR%\module.prop
echo name=Patched YouTube by moxiu6 >> %MODULE_DIR%\module.prop
echo version=1.0 >> %MODULE_DIR%\module.prop
echo versionCode=1 >> %MODULE_DIR%\module.prop
echo author=moxiu6 >> %MODULE_DIR%\module.prop
echo description=Patched YouTube APK with selected patches (no GMS Core). for magisk >> %MODULE_DIR%\module.prop

:: Create the update-binary file
echo Creating update-binary script...
echo #!/system/bin/sh > %MODULE_DIR%\META-INF\com\google\android\update-binary
echo MODULE_PATH=\$MODPATH/system/app/YouTube >> %MODULE_DIR%\META-INF\com\google\android\update-binary
echo APK_PATH=\$MODULE_PATH/com.google.android.youtube-19.47.53-patched-magisk.apk >> %MODULE_DIR%\META-INF\com\google\android\update-binary
echo cp -r \$APK_PATH /system/app/YouTube/ >> %MODULE_DIR%\META-INF\com\google\android\update-binary
echo chmod 644 /system/app/YouTube/com.google.android.youtube-19.47.53-patched-magisk.apk >> %MODULE_DIR%\META-INF\com\google\android\update-binary
echo rm -rf /data/dalvik-cache/* >> %MODULE_DIR%\META-INF\com\google\android\update-binary
echo exit 0 >> %MODULE_DIR%\META-INF\com\google\android\update-binary

:: Create the ZIP package for Magisk
echo Creating Magisk module zip package...
cd %MODULE_DIR%
zip -r ..\patched_youtube_19.47.53_v1.0.zip *
cd ..

:: Completion message
echo Magisk module has been created successfully: patched_youtube_19.47.53_v1.0.zip

pause