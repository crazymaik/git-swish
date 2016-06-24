@echo off
@setlocal enableextensions enabledelayedexpansion

set CMD='%GIT_SWISH_EXE% %*'

set FIRST=1
set PREV=
set CUR=
for /f "delims=" %%i in (%CMD%) do (
    set PREV=!CUR!
    set CUR=%%i
	if !FIRST! == 0 (
		if "!PREV!" == "" (
			echo]
		) else (
			echo !PREV!
		)
	) else (
		set FIRST=0
	)
)

@endlocal & set RESULT=%CUR%

:nextVar
for /F "tokens=1* delims=," %%a in ("%RESULT%") do (
    set %%a
    set RESULT=%%b
)
if defined RESULT goto nextVar
