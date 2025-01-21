@echo off
REM Check if Git is installed
git --version >nul 2>nul
if errorlevel 1 (
    echo Git is not installed. Please install Git and try again.
    exit /b
)

REM Clone the repository
echo Cloning the ReVanced CLI repository...
git clone git@github.com:ReVanced/revanced-cli.git
cd revanced-cli

REM Check if Gradle is installed
gradle -v >nul 2>nul
if errorlevel 1 (
    echo Gradle is not installed. Please install Gradle and try again.
    exit /b
)

REM Attempt to build the project
echo Building the project...
gradle build

REM Check for build success
if errorlevel 0 (
    echo Build succeeded! The built JAR file is located at build/libs/revanced-cli-<version>-all.jar.
    pause
) else (
    echo Build failed! Please ensure your environment is set up correctly.
    echo.
    echo > [!NOTE]
    echo > If the build fails due to authentication, you may need to authenticate to GitHub Packages.
    echo > Create a PAT with the scope "read:packages" [here](https://github.com/settings/tokens/new?scopes=read:packages&description=ReVanced) and add your token to ~/.gradle/gradle.properties.
    echo.
    echo > Example gradle.properties file:
    echo.
    echo > gpr.user = user
    echo > gpr.key = key
    pause
    exit /b
)

REM End script
