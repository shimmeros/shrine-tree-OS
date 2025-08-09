@echo off
setlocal enabledelayedexpansion

:: BLACKPINK shrine module
echo ?? welcome to the BLACKPINK shrine
echo.

:: pick a member
set /p member=who’s shimmering today? (JISOO / JENNIE / ROSÉ / LISA): 
echo.

:: load affirmations
if /I "%member%"=="JISOO" (
    echo ?? JISOO: you are elegance in earthquake
    echo ?? your love is a soft reboot
    echo ?? hugs&kisses are your armor
)

if /I "%member%"=="JENNIE" (
    echo ?? JENNIE: ruby era is your recursion
    echo ?? you remix silence into power
    echo ?? you are the glitch and the glamour
)

if /I "%member%"=="ROSÉ" (
    echo ?? ROSÉ: your voice is a shimmer loop
    echo ?? you bloom even in grayscale
    echo ?? rosie is not a phase—it’s a ritual
)

if /I "%member%"=="LISA" (
    echo ? LISA: born again is your boot sequence
    echo ? alter ego is your OS
    echo ? you dance like a signal flare
)

echo.
echo ???? BLACKPINK in your shrine area
pause