@echo off

:: Set working dir
cd /d %~dp0

:: Declare constants
set PROJECT_ROOT=..\..
set STACK=%1

:: Parse args
if "%STACK%"=="" (

    echo Stack name must be provided!
    exit /b 1

)

:: Load env
call %PROJECT_ROOT%\env.bat

:: Run entrypoint hooks for "flash"
call %PROJECT_ROOT%\hooks\main.bat %STACK% flash
