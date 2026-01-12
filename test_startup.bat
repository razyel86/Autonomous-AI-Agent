@echo off
REM Startup test script for Autonomous AI Agent
REM This script tests the startup components without launching the GUI

setlocal

echo ========================================
echo Autonomous AI Agent - Startup Test
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not installed.
    echo Please install Python 3.8 or higher.
    endlocal
    exit /b 1
)

REM Run the startup test
python test_startup.py

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Startup test completed successfully!
    echo ========================================
) else (
    echo.
    echo ========================================
    echo Startup test failed!
    echo Please check the output above.
    echo ========================================
)

endlocal
exit /b %errorlevel%
