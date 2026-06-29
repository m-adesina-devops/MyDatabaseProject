# run-tests.ps1 - Database Test Runner
param(
    [string]$ConnectionString = "Server=localhost;Database=MyDatabase;Trusted_Connection=True;",
    [string]$TestFolder = ".\UnitTests"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  DATABASE UNIT TESTS" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$tests = Get-ChildItem -Path $TestFolder -Filter "*.sql"

if ($tests.Count -eq 0) {
    Write-Host "No test files found in $TestFolder" -ForegroundColor Yellow
    exit 0
}

$passed = 0
$failed = 0

foreach ($test in $tests) {
    Write-Host "Running test: $($test.Name)" -ForegroundColor Yellow
    
    try {
        # Run the SQL script using sqlcmd
        $output = sqlcmd -S "localhost" -d "MyDatabase" -E -i $test.FullName -h -1 2>&1
        
        # Check if test passed or failed
        if ($output -match "PASS") {
            Write-Host "  ✅ PASSED" -ForegroundColor Green
            $passed++
        } elseif ($output -match "FAIL") {
            Write-Host "  ❌ FAILED" -ForegroundColor Red
            $failed++
        } else {
            Write-Host "  ℹ️  UNKNOWN (check output)" -ForegroundColor Yellow
            Write-Host $output
            $failed++
        }
    }
    catch {
        Write-Host "  ❌ ERROR: $_" -ForegroundColor Red
        $failed++
    }
    
    Write-Host ""
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  RESULTS" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Passed: $passed" -ForegroundColor Green
Write-Host "  Failed: $failed" -ForegroundColor Red
Write-Host "  Total:  $(($passed + $failed))" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan

if ($failed -gt 0) {
    Write-Host "SOME TESTS FAILED!" -ForegroundColor Red
    exit 1
} else {
    Write-Host "ALL TESTS PASSED!" -ForegroundColor Green
    exit 0
}