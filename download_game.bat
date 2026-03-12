@echo off
setlocal enabledelayedexpansion
title QueryWars - Database Installer
color 0B

:: ==============================================================================
:: CONFIGURATION
:: Set your base GitHub Raw URL here so the script knows where to download from
:: ==============================================================================
set "BASE_URL=https://github.com/prabeenragupathi/QueryWars/tree/main"
set "TEMP_CONFIG=temp_games_meta.txt"

echo ===================================================
echo             WELCOME TO QUERYWARS
echo       Automated PostgreSQL Mission Setup
echo ===================================================
echo.

:: 1. COLLECT DATABASE CREDENTIALS
echo [Database Connection Details]
set /p pg_user="Username (default 'postgres'): "
if "%pg_user%"=="" set pg_user=postgres

set /p pg_pass="Password (press Enter if none/trusted): "

set /p pg_db="Target Database (default 'postgres'): "
if "%pg_db%"=="" set pg_db=postgres

set /p pg_host="Host (default 'localhost'): "
if "%pg_host%"=="" set pg_host=localhost

set /p pg_port="Port (default '5432'): "
if "%pg_port%"=="" set pg_port=5432

:: Set the password as an environment variable so psql uses it silently
if not "%pg_pass%"=="" set PGPASSWORD=%pg_pass%

echo.
echo Fetching latest missions from QueryWars servers...
curl -s -L -o %TEMP_CONFIG% "%BASE_URL%/config/games_meta.txt"

if not exist %TEMP_CONFIG% (
    echo [ERROR] Failed to fetch mission list from GitHub. Check your internet connection.
    pause
    exit /b
)

:: 2. DYNAMICALLY BUILD THE MENU FROM THE CONFIG FILE
echo.
echo ===================================================
echo               AVAILABLE MISSIONS
echo ===================================================
for /f "tokens=1,2,3 delims=|" %%A in (%TEMP_CONFIG%) do (
    echo [%%A] %%B
)
echo ===================================================
echo.

:: 3. GET USER CHOICE
set /p choice="Enter the Mission ID you want to install: "

:: 4. FIND THE MATCHING SQL FILE FOR THE CHOSEN ID
set "sql_file="
set "mission_name="
for /f "tokens=1,2,3 delims=|" %%A in (%TEMP_CONFIG%) do (
    if "%%A"=="%choice%" (
        set "mission_name=%%B"
        set "sql_file=%%C"
    )
)

if "%sql_file%"=="" (
    echo [ERROR] Invalid Mission ID selected.
    del %TEMP_CONFIG%
    pause
    exit /b
)

:: 5. DOWNLOAD AND EXECUTE THE SQL FILE
echo.
echo Preparing Mission: %mission_name%
echo Downloading %sql_file%...
curl -s -L -o "%sql_file%" "%BASE_URL%/scripts/%sql_file%"

echo.
echo Deploying database schema and injecting data into '%pg_db%'...
psql -U %pg_user% -h %pg_host% -p %pg_port% -d %pg_db% -f "%sql_file%"

:: 6. CLEANUP
del %TEMP_CONFIG%
echo.
echo ===================================================
echo SUCCESS! Mission deployed successfully.
echo Open your PostgreSQL terminal/GUI and connect to '%pg_db%'.
echo ===================================================
pause