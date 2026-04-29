@echo off
title Py3D CLI 1.3
setlocal

:: check python
python --version >nul 2>&1
if errorlevel 1 goto ins_py

:: =========================
:: CLI
:: =========================

if "%1"=="-help" goto help
if "%1"=="-h" goto help
if "%1"=="-venv" goto venv
if "%1"=="-server" goto server
if "%1"=="-create" goto create
if "%1"=="-run" goto run
if "%1"=="-install" goto install
if "%1"=="" goto welcome

echo Unknown command. Use py3d -help
goto end


:welcome
echo Welcome in Py3D
echo Type: py3d -help
goto end


:help
echo.
echo Py3D helper
echo =====================
echo -help    : show help
echo -venv    : create a .venv
echo -server  : start HTTP server
echo -create  : create a project
echo -run     : run a python file
echo -install : install packs
echo.
pause
goto end


:venv
echo Creating venv...
py -3.12 -m venv .venv
if exist ".venv\" echo Venv created
goto end


:server
echo Starting server...
py -3.12 -m http.server 8000
goto end


:create
set base=%APPDATA%\.turf\py3d\project

if not exist "%base%" mkdir "%base%"

cd /d "%base%"
if not exist "Py3D_project" mkdir "Py3D_project"

echo print("Py3D project") > Py3D_project\main.py
goto end


:run
set file=%2

if "%file%"=="" (
    echo No file specified
    goto end
)

if not exist "%file%" (
    echo File not found
    goto end
)

py -3.12 "%file%"
goto end


:install
if "%2"=="-pack" (
    set pck=%3
	if "pck"=="" echo please type a pack name.
	else (
		echo Installing %pck% pack...
		curl -L https://raw.githubusercontent.com/Neroblyt/py3d/refs/heads/packs/%pck%.txt > pack.txt
		py -3.12 -m pip install -r pack.txt
		del pack.txt
	)
)
if "%2"=="-lib" (
	set lib=%3
	if "%lib%"=="" echo please type a lib.
	else py -3.12 -m pip install %lib%
)
goto end


:ins_py
echo Python not installed
set /p want_install=Install Python 3.12 ? [Y/N]:

if /I "%want_install%"=="Y" (
    winget install Python.Python.3.12 -e
)

goto end


:end
endlocal
