@echo off

:: "Source" env batch file
call setenv.bat

:: Change the current directory to the specified path
cd "C:\Users\Jonathan\Documents\My Games"

:: Set the link name and target path
set link_name="OpenMW"
set target_path="D:\ds.lenovo-legion\morrowind\openmw"

:: Create the symbolic link
mklink /d "%link_name%" "%target_path%"
