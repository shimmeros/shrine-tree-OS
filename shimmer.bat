@echo off
setlocal enabledelayedexpansion

:: shimmer_duo.bat - 2-way affirmation ritual with speaker validation

set "duo_file=shimmer_duo.txt"
set "people_file=shimmer_people.txt"
set /a count=0
set "valid=0"

:: prompt for speaker
echo.
set /p speaker=🌿 WHO SPEAKS? (JADE, PALMER, LADY PALMER, EVE, DANIEL): 

:: validate speaker from shimmer_people.txt
for /f "usebackq tokens=1 delims=:" %%A in ("%people_file%") do (
    set "line=%%A"
    set "line=!line:~1,-1!"
    if /i "!line!"=="%speaker%" set "valid=1"
)

if "%valid%"=="0" (
    echo ❌ Invalid speaker. Please check shimmer_people.txt
    goto :eof
)

:: optional: set color based on speaker
if /i "%speaker%"=="JADE" color 0A
if /i "%speaker%"=="PALMER" color 0B
if /i "%speaker%"=="LADY PALMER" color 0D
if /i "%speaker%"=="EVE" color 0C
if /i "%speaker%"=="DANIEL" color 0E

:: display matching lines
echo.
echo 🌿 SHIMMER DUO 🌿
for /f "usebackq delims=" %%A in ("%duo_file%") do (
    set "line=%%A"
    echo !line! | findstr /i "[%speaker%]" >nul
    if !errorlevel! == 0 (
        echo !line!
        set /a count+=1
        if !count! GEQ 2 goto :done
    )
)

:done
echo.
endlocal
pause