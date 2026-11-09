@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Usage: %~nx0 ^<NewPassword^>
    exit /b 1
)

set "NEWPASS=%~1"

echo Resetting passwords for all domain user accounts...
for /f "delims=" %%u in ('dsquery user -limit 0') do (
    echo Changing password for: %%u
    dsmod user "%%u" -pwd "%NEWPASS%" -mustchpwd no
)

echo Done. All domain user account passwords have been reset.
endlocal
