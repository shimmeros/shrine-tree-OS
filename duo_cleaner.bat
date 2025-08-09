@echo off
setlocal enabledelayedexpansion

:: init counters
set "lineCount=0"
set "errorCount=0"

echo scanning shimmer_duo.txt for visual bugs...
echo.

:: loop through each line
for /f "usebackq delims=" %%a in ("shimmer_duo.txt") do (
    set /a lineCount+=1
    set "line=%%a"

    :: check for forbidden characters
    echo !line! | findstr /R "[&<>|]" >nul
    if !errorlevel! == 0 (
        echo ?? line !lineCount! contains forbidden characters:
        echo    !line!
        set /a errorCount+=1
    )

    :: check for missing speaker tag
    echo !line! | findstr /R "^\[[A-Z ]\+\]" >nul
    if !errorlevel! NEQ 0 (
        echo ?? line !lineCount! missing or malformed speaker tag:
        echo    !line!
        set /a errorCount+=1
    )
)

echo.
echo ? scan complete: !lineCount! lines checked, !errorCount! issues found.
pause