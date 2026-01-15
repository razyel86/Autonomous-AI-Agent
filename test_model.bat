@echo off
REM Test script for Qwen2.5-Omni-3B model
REM This script verifies that the model was downloaded correctly

setlocal

echo ========================================
echo Qwen2.5-Omni-3B Model Test
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not installed.
    echo Please install Python 3.8 or higher from https://www.python.org/
    endlocal
    exit /b 1
)

REM Run the test script
python test_model.py

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo Model test completed successfully!
    echo ========================================
) else (
    echo.
    echo ========================================
    echo Model test failed!
    echo Please check the output above for details.
    echo ========================================
)

endlocal
exit /b %errorlevel%
