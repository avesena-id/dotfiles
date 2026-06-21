# Android
[Environment]::SetEnvironmentVariable("ANDROID_HOME", "$env:USERPROFILE\AppData\Local\Android\Sdk", "User")

# Get Path
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")

$myPaths = @(
    "$env:USERPROFILE\bin",
    "$env:USERPROFILE\.local\bin",
    "$env:USERPROFILE\AppData\Local\Android\Sdk\emulator", 
    "$env:USERPROFILE\AppData\Local\Android\Sdk\platform-tools",
    "$env:USERPROFILE\AppData\Local\Android\Sdk\cmdline-tools\latest\bin"
)

foreach ($path in $myPaths) {
    if ($currentPath -notlike "*$path*") {
        # Pastikan tidak ada tanda titik koma (;) yang double di dalam string
        if ($currentPath -and !$currentPath.EndsWith(";")) { $currentPath += ";" }
        $currentPath += $path
    }
}

[Environment]::SetEnvironmentVariable("Path", $currentPath, "User")
