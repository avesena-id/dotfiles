$ConfigDir = "$HOME\.config\powershell"

Get-ChildItem "$ConfigDir\*.ps1" |
    Where-Object Name -ne "profile.ps1" |
    Sort-Object Name |
    ForEach-Object {
        . $_.FullName
    }
