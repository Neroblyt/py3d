$host.UI.RawUI.WindowTitle="Py3D Installer 1.3"
$dest = "$env:APPDATA\.turf"
$url = "https://raw.githubusercontent.com/Neroblyt/py3d/main/py3d.bat"

# créer dossier
mkdir $dest -Force | Out-Null

# télécharger script
curl.exe -L -o "$dest\py3d.bat" $url

# ajouter au PATH
$path = [Environment]::GetEnvironmentVariable("Path", "User")

if ($path -notlike "*$dest*") {
    [Environment]::SetEnvironmentVariable("Path", "$path;$dest", "User")
}

Write-Host "Successfull installing"
pause
