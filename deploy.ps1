# deploy.ps1 - Manual deployment script
Write-Host "Building SQL project..." -ForegroundColor Yellow
dotnet build MyDatabaseProject.sqlproj -o ./output

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed!" -ForegroundColor Red
    exit 1
}

Write-Host "`nBuild succeeded!" -ForegroundColor Green
Write-Host "The dacpac is at: ./output/MyDatabaseProject.dacpac" -ForegroundColor Cyan
Write-Host "`nTo deploy, run:" -ForegroundColor Yellow
Write-Host "sqlpackage /Action:Publish /SourceFile:./output/MyDatabaseProject.dacpac /TargetConnectionString:`"YourConnectionString`"" -ForegroundColor Cyan