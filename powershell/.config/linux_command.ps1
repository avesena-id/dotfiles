$aliasesToUnbind = @('mkdir', 'rm', 'cp', 'mv', 'cat')
foreach ($alias in $aliasesToUnbind) {
    if (Get-Alias -Name $alias -ErrorAction SilentlyContinue) {
        Remove-Item -Path "Alias:\$alias" -Force
    }
}

function mkdir {
    param([string]$Name)
    New-Item -ItemType Directory -Path $Name
}

function rm {
    param(
        [Parameter(ValueFromRemainingArguments)]
        [string[]]$Path
    )
    Remove-Item $Path -Recurse -Force
}

function cp {
    param(
        [string]$Source,
        [string]$Destination
    )
    Copy-Item $Source $Destination -Recurse -Force
}

function mv {
    param(
        [string]$Source,
        [string]$Destination
    )
    Move-Item $Source $Destination
}

function cat {
    param(
        [Parameter(ValueFromRemainingArguments)]
        [string[]]$File
    )
    Get-Content $File
}
