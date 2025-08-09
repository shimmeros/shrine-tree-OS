@echo off
setlocal enabledelayedexpansion

:: prompt for speaker
set /p speaker=who’s speaking? 

:: normalize speaker (optional)
set "speaker=!speaker:~0,1!!speaker:~1!"

:: prompt for message
set /p message=what do they say? 

:: sanitize message
set "message=!message:^=^^!"
set "message=!message:<=^<!"
set "message=!message:>=^>!"
set "message=!message:&=^&!"
set "message=!message:|=^|!"

:: format line
set "line=[%speaker%] !message!"

:: append to shimmer_duo.txt
>> shimmer_duo.txt echo !line!

echo ? added: !line!
pause