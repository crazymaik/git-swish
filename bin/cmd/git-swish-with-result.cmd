@echo off
@setlocal enableextensions enabledelayedexpansion

set CMD='%GIT_SWISH_EXE% %*'

set PREV=
set CUR=
for /f "delims=" %%i in (%CMD%) do (
    set PREV=!CUR!
    set CUR=%%i
    echo !PREV!
)

@endlocal & set RESULT=%CUR%

:nextVar
for /F "tokens=1* delims=," %%a in ("%RESULT%") do (
    set %%a
    set RESULT=%%b
)
if defined RESULT goto nextVar
