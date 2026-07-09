Write-Host "========================================" -ForegroundColor Green
Write-Host "MedBridge - Flutter Auto Setup Script" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

$SrcDir = "C:\src"
$ZipPath = "C:\src\flutter_windows.zip"
$DestDir = "C:\src\flutter"

# 1. Create source folder if it doesn't exist
if (!(Test-Path $SrcDir)) {
    New-Item -ItemType Directory -Path $SrcDir -Force | Out-Null
    Write-Host "Created folder $SrcDir" -ForegroundColor Cyan
}

# 2. Download Flutter SDK if not already downloaded
if (!(Test-Path $ZipPath)) {
    Write-Host "Downloading Flutter Stable SDK (approx 900MB)..." -ForegroundColor Cyan
    $Url = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.22.2-stable.zip"
    curl.exe -L -o $ZipPath $Url
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Download failed using curl. Trying PowerShell WebRequest..." -ForegroundColor Yellow
        Invoke-WebRequest -Uri $Url -OutFile $ZipPath
    }
} else {
    Write-Host "Found existing Flutter SDK zip at $ZipPath" -ForegroundColor Green
}

# 3. Extract the SDK
if (!(Test-Path $DestDir)) {
    Write-Host "Extracting Flutter SDK to $SrcDir (this may take a few minutes)..." -ForegroundColor Cyan
    Expand-Archive -Path $ZipPath -DestinationPath $SrcDir -Force
    Write-Host "Successfully extracted to $DestDir" -ForegroundColor Green
} else {
    Write-Host "Flutter is already extracted in $DestDir" -ForegroundColor Green
}

# 4. Add to User Environment Path if not already there
Write-Host "Configuring Environment PATH..." -ForegroundColor Cyan
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
$FlutterBin = "C:\src\flutter\bin"

if ($UserPath -split ';' -contains $FlutterBin) {
    Write-Host "Flutter bin is already in your Environment PATH." -ForegroundColor Green
} else {
    $NewPath = $UserPath + ";" + $FlutterBin
    [Environment]::SetEnvironmentVariable("Path", $NewPath, "User")
    Write-Host "Added $FlutterBin to User Environment PATH!" -ForegroundColor Green
    Write-Host "Note: Please restart your terminal/VS Code for the changes to take effect." -ForegroundColor Yellow
}

Write-Host "`nFlutter setup completed successfully! Run 'flutter doctor' in a new terminal window to verify." -ForegroundColor Green
