# Environment

$env:GIT_SSH = "$env:WINDIR\System32\OpenSSH\ssh.exe"

# Mise
(& mise activate pwsh) | Out-String | Invoke-Expression

# Starship
Invoke-Expression (& starship init powershell)

# Terminal Icons
Import-Module Terminal-Icons -ErrorAction SilentlyContinue

# zoxide / z
Import-Module z -ErrorAction SilentlyContinue
