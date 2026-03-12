@echo off
title SQL War - Game Downloader
color 0A

echo ===================================================
echo       WELCOME TO THE SQL WAR GAME INSTALLER
echo ===================================================
echo.

:: Ask the user for their Postgres username so the script has permission to build the DB
set /p pg_user="Enter your PostgreSQL username (usually 'postgres'): "
if "%pg_user%"=="" set pg_user=postgres

echo.
echo Please select the database challenge you want to install:
echo [1] Round 3: The Echoes of Eelam (Intelligence Forensics)
echo [2] Round 2: TechMart E-Commerce
echo [3] Round 2: Corporate HR
echo.

set /p choice="Enter the index number (1-3): "

:: Map the user's choice to the raw GitHub URL
if "%choice%"=="1" (
    set db_name=eelam_forensics
    set sql_url=https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME/main/questions/Eelam/eelam_forensics.sql
    set file_name=eelam_forensics.sql
) else if "%choice%"=="2" (
    set db_name=techmart_db
    set sql_url=https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME/main/questions/TechMart/techmart.sql
    set file_name=techmart.sql
) else if "%choice%"=="3" (
    set db_name=corporate_hr_db
    set sql_url=https://raw.githubusercontent.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME/main/questions/CorporateHR/corporate_hr.sql
    set file_name=corporate_hr.sql
) else (
    echo Invalid choice! Exiting...
    pause
    exit /b
)

echo.
echo Downloading %file_name% from GitHub...
curl -s -L -o %file_name% %sql_url%

echo.
echo Creating database '%db_name%' (if it doesn't exist)...
:: Connects to default postgres DB just to run the CREATE DATABASE command
psql -U %pg_user% -d postgres -c "CREATE DATABASE %db_name%;" 2>nul

echo.
echo Populating the database with schemas and data...
psql -U %pg_user% -d %db_name% -f %file_name%

echo.
echo ===================================================
echo SUCCESS! The challenge is ready.
echo Open your psql terminal and connect using:
echo \c %db_name%
echo ===================================================
pause