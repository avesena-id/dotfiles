function reload {
    . $PROFILE
    Clear-Host
}

function config {
    nvim "$HOME\.config\powershell"
}

function which {
    param(
        [Parameter(Mandatory)]
        [string]$Command
    )

    (Get-Command $Command -ErrorAction SilentlyContinue).Path
}

function touch {
    param(
        [Parameter(ValueFromRemainingArguments)]
        [string[]]$Paths
    )

    foreach ($Path in $Paths) {

        if (Test-Path $Path) {
            (Get-Item $Path).LastWriteTime = Get-Date
        }
        else {
            New-Item `
                -ItemType File `
                -Path $Path `
                -Force | Out-Null
        }

    }
}
