# Get the path to the startup folder
$StartupFolder = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup")

# Get the script's full path
$ScriptPath = $MyInvocation.MyCommand.Path

# Define the destination path in the startup folder
$StartupScriptPath = [System.IO.Path]::Combine($StartupFolder, [System.IO.Path]::GetFileName($ScriptPath))

# Copy the script to the startup folder
Copy-Item -Path $ScriptPath -Destination $StartupScriptPath -Force
