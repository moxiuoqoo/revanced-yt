@echo off
set INPUT_APK=C:\path\to\com.google.android.apps.youtube.music_7.29.52-x86_64-revanced.apk
set OUTPUT_DIR=C:\revanced-patching\revaned-cli\revanced-cli\build\distributions\revanced-cli-5.0.0\revanced-cli-5.0.0\bin\apk-output
set PATCHES_FILE=C:\path\to\patches-5.10.0.rvp

rem Run the patching command
revanced-cli.bat patch --patches %PATCHES_FILE% -o %OUTPUT_DIR% -e "Hide 'Get Music Premium' label" -e "Remove upgrade button" -e "Bypass certificate checks" -e "Remove background playback restrictions" -e "Hide music video ads" -e "GmsCore support" -e "Spoof client" %INPUT_APK%

rem Keep the window open after execution
pause