@echo off
REM Installation script for Autonomous AI Agent
REM This script installs all required dependencies

setlocal

echo ========================================
echo Autonomous AI Agent - Installation
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

echo Python found:
python --version
echo.

REM Check Python version
python -c "import sys; exit(0 if sys.version_info >= (3, 8) else 1)" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python 3.8 or higher is required.
    endlocal
    exit /b 1
)

REM Check if pip is installed
pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: pip is not installed.
    echo Please install pip or reinstall Python with pip included.
    endlocal
    exit /b 1
)

echo Installing dependencies...
echo.

REM Install requirements
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo Error: Failed to install dependencies
    echo Please check the error messages above
    echo ========================================
    endlocal
    exit /b 1
)

echo.
echo ========================================
echo Installation completed successfully!
echo.
echo Next steps:
echo 1. Set GEMINI_API_KEY environment variable
echo    setx GEMINI_API_KEY "your-api-key-here"
echo.
echo 2. (Optional) Download Qwen model:
echo    setup_model.bat
echo.
echo 3. Start the application:
echo    start.bat
echo ========================================

endlocal
