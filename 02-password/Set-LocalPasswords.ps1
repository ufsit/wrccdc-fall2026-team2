<#
.SYNOPSIS
    Changes the password for all local Windows user accounts to a single new password.

.USAGE
    .\Set-AllLocalPasswords.ps1 -NewPassword 'Str0ng!P@ssw0rd#2024'

    Must be run from an elevated (Administrator) PowerShell session.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$NewPassword
)

# Require elevation
if (-not ([Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544')) {
    Write-Warning "This script should be run as Administrator for it to succeed on all accounts."
}

$SecurePassword = ConvertTo-SecureString -String $NewPassword -AsPlainText -Force

$localUsers = Get-LocalUser

foreach ($user in $localUsers) {
    try {
        Set-LocalUser -Name $user.Name -Password $SecurePassword -ErrorAction Stop
        Write-Host "[+] Password changed for: $($user.Name)" -ForegroundColor Green
    }
    catch {
        Write-Warning "[-] Failed to change password for '$($user.Name)': $($_.Exception.Message)"
    }
}

Write-Host "Done. Review any warnings above for accounts that failed (e.g. built-in disabled accounts)." -ForegroundColor Cyan
