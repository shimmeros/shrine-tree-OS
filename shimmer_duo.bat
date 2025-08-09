@echo off
setlocal enabledelayedexpansion

:: prompt for speaker
set /p speaker=who’s speaking? 

:: normalize speaker to uppercase
set "speaker=!speaker:~0,1!!speaker:~1!"

:: check if shimmer_duo.txt exists
if not exist shimmer_duo.txt (
    echo ✘ shimmer_duo.txt not found.
    pause
    exit /b
)

:: search for matching lines
set "found=0"
for /f "usebackq delims=" %%a in ("shimmer_duo.txt") do (
    set "line=%%a"
    echo !line! | findstr /C:"[%speaker%]" >nul
    if !errorlevel! == 0 (
        echo !line!
        set /a found+=1
        if !found! GEQ 2 goto :done
    )
)

:done
if !found! EQU 0 (
    echo ✘ no lines found for [%speaker%]
)
pause