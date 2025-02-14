@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  revanced-cli startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and REVANCED_CLI_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\revanced-cli-5.0.0.jar;%APP_HOME%\lib\revanced-library-jvm-3.0.2.jar;%APP_HOME%\lib\revanced-patcher-21.0.0.jar;%APP_HOME%\lib\kotlin-reflect-2.0.20.jar;%APP_HOME%\lib\kotlinx-coroutines-core-jvm-1.8.1.jar;%APP_HOME%\lib\kotlinx-serialization-core-jvm-1.7.1.jar;%APP_HOME%\lib\kotlinx-serialization-json-jvm-1.7.1.jar;%APP_HOME%\lib\kotlin-stdlib-2.0.20.jar;%APP_HOME%\lib\picocli-4.7.6.jar;%APP_HOME%\lib\annotations-23.0.0.jar;%APP_HOME%\lib\apktool-lib-2.9.3.jar;%APP_HOME%\lib\multidexlib2-3.0.3.r3.jar;%APP_HOME%\lib\smali-3.0.5.jar;%APP_HOME%\lib\xpp3-1.1.4c.jar;%APP_HOME%\lib\apkzlib-8.5.2.jar;%APP_HOME%\lib\apksig-8.5.2.jar;%APP_HOME%\lib\bcpkix-jdk18on-1.77.jar;%APP_HOME%\lib\smali-baksmali-3.0.3.jar;%APP_HOME%\lib\brut.j.dir-2.9.3.jar;%APP_HOME%\lib\brut.j.util-2.9.3.jar;%APP_HOME%\lib\smali-util-3.0.5.jar;%APP_HOME%\lib\smali-dexlib2-3.0.5.jar;%APP_HOME%\lib\guava-33.2.1-jre.jar;%APP_HOME%\lib\jadb-1.2.1.jar;%APP_HOME%\lib\commons-text-1.11.0.jar;%APP_HOME%\lib\commons-lang3-3.14.0.jar;%APP_HOME%\lib\commons-io-2.15.1.jar;%APP_HOME%\lib\brut.j.common-2.9.3.jar;%APP_HOME%\lib\antlr-3.5.2.jar;%APP_HOME%\lib\ST4-4.0.8.jar;%APP_HOME%\lib\antlr-runtime-3.5.2.jar;%APP_HOME%\lib\jcommander-1.64.jar;%APP_HOME%\lib\stringtemplate-3.2.1.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\bcutil-jdk18on-1.77.jar;%APP_HOME%\lib\bcprov-jdk18on-1.77.jar;%APP_HOME%\lib\failureaccess-1.0.2.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\checker-qual-3.42.0.jar;%APP_HOME%\lib\error_prone_annotations-2.26.1.jar;%APP_HOME%\lib\mockito-core-2.28.2.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\byte-buddy-1.9.10.jar;%APP_HOME%\lib\byte-buddy-agent-1.9.10.jar;%APP_HOME%\lib\objenesis-2.6.jar


@rem Execute revanced-cli
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %REVANCED_CLI_OPTS%  -classpath "%CLASSPATH%" app.revanced.cli.command.MainCommandKt %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable REVANCED_CLI_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%REVANCED_CLI_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
