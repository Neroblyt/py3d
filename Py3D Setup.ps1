$host.UI.RawUI.WindowTitle="Py3D Installer"
$dest = "$env:APPDATA\.turf"
$target = "$dest\py3d.bat"
$url = "https://raw.githubusercontent.com/Neroblyt/py3d/main/py3d.bat"

Write-Host "Installing Py3D..." -ForegroundColor Green

# créer dossier
New-Item -ItemType Directory -Force -Path $dest | Out-Null

# télécharger fichier
curl.exe -L -o $target $url

# vérification
if (!(Test-Path $target)) {
    Write-Host "Download failed" -ForegroundColor Red
    pause
    exit
}

Write-Host "Download OK" -ForegroundColor Green

# PATH
Write-Host "Adding to PATH..." -ForegroundColor Yellow

$old = [Environment]::GetEnvironmentVariable("Path", "User")
if (-not $old) { $old = "" }

if ($old -notmatch [regex]::Escape($dest)) {
    $new = $old + ";" + $dest
    [Environment]::SetEnvironmentVariable("Path", $new, "User")
    Write-Host "PATH updated" -ForegroundColor Green
} else {
    Write-Host "PATH already configured" -ForegroundColor Cyan
}

Write-Host "Py3D installed successfully"
pause