#!/bin/bash

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git and try again."
    exit 1
fi

# Clone the repository
echo "Cloning the ReVanced CLI repository..."
git clone git@github.com:ReVanced/revanced-cli.git
cd revanced-cli || exit

# Check if Gradle is installed
if ! command -v gradle &> /dev/null; then
    echo "Gradle is not installed. Please install Gradle and try again."
    exit 1
fi

# Attempt to build the project
echo "Building the project..."
gradle build

# Check for build success
if [ $? -eq 0 ]; then
    echo "Build succeeded! The built JAR file is located at build/libs/revanced-cli-<version>-all.jar."
    read -p "Press Enter to continue..."
else
    echo "Build failed! Please ensure your environment is set up correctly."
    echo
    echo "[!NOTE]"
    echo "If the build fails due to authentication, you may need to authenticate to GitHub Packages."
    echo "Create a PAT with the scope 'read:packages' [here](https://github.com/settings/tokens/new?scopes=read:packages&description=ReVanced) and add your token to ~/.gradle/gradle.properties."
    echo
    echo "Example gradle.properties file:"
    echo
    echo "gpr.user = user"
    echo "gpr.key = key"
    read -p "Press Enter to continue..."
    exit 1
fi