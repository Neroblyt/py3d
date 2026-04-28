@echo off
setlocal

:: =========================
:: PY3D CLI
:: =========================

if "%1"=="-help" goto help
if "%1"=="-h" goto help
if "%1"=="-venv" goto venv
if "%1"=="-server" goto server
if "%1"=="-create" goto create
if "%1"=="-run" goto run
if "%1"=="" goto welcome

echo Unknown command. Use py3d -help
goto end


:welcome
echo Welcome in Py3D 🚀
echo Type: py3d -help
goto end


:help
echo.
echo Py3D helper 🚀
echo =====================
echo -help    : show help
echo -venv    : create a .venv
echo -server  : start HTTP server
echo -create  : create a project
echo -run     : run a python file
echo.
goto end


:venv
echo Creating venv...

py -3.12 -m venv .venv

IF EXIST ".venv\" (
    echo Venv created successfully 🚀
) ELSE (
    echo Failed to create venv ❌
)

goto end


:server
echo Starting server...
py -3.12 -m http.server 8000

echo Server running at http://localhost:8000
goto end


:create
set base=%APPDATA%\.turf\py3d\project

if not exist "%base%" (
    echo Creating project folder...
    mkdir "%base%"
)

cd /d "%base%"

if not exist "Py3D_project" mkdir "Py3D_project"

echo print("Py3D project 🚀") > Py3D_project\main.py

echo Project created at %base%\Py3D_project
goto end


:run
set file=%2

if "%file%"=="" (
    echo No file specified
    echo Usage: py3d -run script.py
    goto end
)

if not exist "%file%" (
    echo File not found: %file%
    goto end
)

py -3.12 "%file%"
goto end


:end
endlocal