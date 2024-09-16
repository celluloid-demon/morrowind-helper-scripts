@echo off

:: Declare constants
set STACK=%1
set OPERATION=%2

:: ###########################
:: #                         #
:: #          Setup          #
:: #                         #
:: ###########################

call :doctor_windows

:: ###############################
:: #                             #
:: #          Morrowind          #
:: #                             #
:: ###############################

set _stack=morrowind

if "%STACK%"=="%_stack%" if "%OPERATION%"=="flash" (

    call :doctor_morrowind

    echo Creating symlink...

    mklink /d "%MORROWIND_VOLUME_OPENMW_PATH%" "%MORROWIND_VOLUME_OPENMW_CONFIG%"

)

:: ##############################
:: #                            #
:: #          HOOK END          #
:: #                            #
:: ##############################

exit /b 0

:: ##########################################
:: #                                        #
:: #          FUNCTION DEFINITIONS          #
:: #                                        #
:: ##########################################

:load_env

    call .env
    exit  /b 0

:doctor_morrowind

    call :test_dir %MORROWIND_VOLUME_OPENMW_CONFIG%
    exit /b 0

:doctor_windows

    call :test_dir %MY_GAMES%
    exit /b 0

:test_dir

    if not exist "%MORROWIND_VOLUME_OPENMW_CONFIG%" (

        echo MORROWIND_VOLUME_OPENMW_CONFIG: %MORROWIND_VOLUME_OPENMW_CONFIG% not found, exiting...
        exit 1

    )

    exit /b 0
