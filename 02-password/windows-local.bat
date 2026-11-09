@echo off
setlocal enabledelayedexpansion

REM --- Check for a password argument ---
if "%~1"=="" (
    echo Usage: %~nx0 ^<new_password^>
    exit /b 1
)
set "NEWPASS=%~1"

REM --- Check for Administrator privileges ---
net session >nul 2>&1
if errorlevel 1 (
    echo ERROR: This script must be run as Administrator.
    exit /b 1
)

echo Enumerating local user accounts...
echo.

for /f "usebackq delims=" %%U in (`powershell -NoProfile -Command "Get-LocalUser | Select-Object -ExpandProperty Name"`) do (
    set "ACCOUNT=%%U"
    if not "!ACCOUNT!"=="" (
        net user "!ACCOUNT!" "!NEWPASS!" >nul 2>&1
        if errorlevel 1 (
            echo [FAILED] !ACCOUNT!
        ) else (
            echo [OK]     !ACCOUNT!
        )
    )
)

echo.
echo Done. All local account passwords have been updated to the new value.
endlocal
