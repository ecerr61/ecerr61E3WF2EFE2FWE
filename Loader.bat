@echo off
cd /d %~dp0
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -WorkingDirectory '%~dp0' -Verb runAs"
    exit /b
)

@shift /0
@echo off
setlocal enabledelayedexpansion
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"
mode con: cols=80 lines=25
color 09
title ALZAABI LOADER

cls
color 09
echo.
echo ====================================================
echo             ALZAABI - FREE PERM SPOOFER 
echo ====================================================
echo.
echo             Loading ALZAABI perm Loader...
timeout /t 2 >nul

goto menu

:menu
cls
color 09
echo ====================================================
echo             ALZAABI - PERM SPOOFER 
echo ====================================================
echo            Made by: GENERAL
echo            Discord: discord.gg/uuuu
echo ====================================================
echo.
echo [1] PERM SPOOF
echo [2] JOIN DISCORD
echo [3] EXIT
echo.
set /p choice=Enter your choice (1, 2 or 3): 

if "%choice%"=="1" goto spoof
if "%choice%"=="2" start https://discord.gg/uuuu & exit /b
if "%choice%"=="3" exit /b

echo Invalid option. Exiting...
timeout /t 2 >nul
exit /b

:spoof
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [!] Requesting administrative privileges...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c cd /d ""%SCRIPT_DIR%"" && ""%~f0""", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /b
)


set "spoofer_dir=%SCRIPT_DIR%DRIVER"
if not exist "%spoofer_dir%" (
    echo [ERROR] DRIVER folder not found!
    echo Current directory: %CD%
    echo Looking for: %spoofer_dir%
    pause
    exit /b
)
cd /d "%spoofer_dir%"

:: Trouver le fichier .sys
for %%f in (*.sys) do (
    set "driver=%%f"
    goto :foundDriver
)

echo [ERROR] No .sys driver found in DRIVER folder.
pause
exit /b

:foundDriver
cls
color 09
echo [*] Starting spoof...
echo [*] Using driver: !driver!
timeout /t 2 >nul

:: Lancer le spoofer avec le driver
conspiracy.exe /SS "ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%" >nul 2>&1
conspiracy.exe /BS "ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%" >nul 2>&1
conspiracy.exe /BP "ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%" >nul 2>&1
conspiracy.exe /SP "ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%" >nul 2>&1
conspiracy.exe /PSN "ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%" >nul 2>&1
conspiracy.exe /DD "ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%-ALZAABI-%RANDOM%%RANDOM%" >nul 2>&1
conspiracy.exe /SU auto >nul 2>&1



timeout /t 2 >nul

echo.
echo [+] Spoof complete!
echo [!] Please restart your PC to apply changes.
exit /b
