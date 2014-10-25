@echo off
set GIT_SWISH=%~dp0
set GIT_SWISH=%GIT_SWISH:~0,-1%\..
set GIT_SWISH_BIN=%GIT_SWISH%\bin\cmd
doskey /macrofile=%GIT_SWISH_BIN%\aliases.txt
