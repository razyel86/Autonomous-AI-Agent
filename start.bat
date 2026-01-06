@echo off
REM Startup script for Autonomous AI Agent
REM This script starts the AI Agent application

setlocal

echo ========================================
echo Autonomous AI Agent - Starting
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not installed.
    echo Please run install.bat first.
    endlocal
    exit /b 1
)

REM Check if GEMINI_API_KEY is set
if not defined GEMINI_API_KEY (
    echo Warning: GEMINI_API_KEY environment variable is not set.
    echo.
    echo The application requires a Gemini API key to function.
    echo You can set it with:
    echo   setx GEMINI_API_KEY "your-api-key-here"
    echo.
    echo Or set it temporarily for this session:
    set /p TEMP_KEY="Enter your Gemini API key (or press Enter to exit): "
    if "!TEMP_KEY!"=="" (
        echo Exiting...
        endlocal
        exit /b 1
    )
    set GEMINI_API_KEY=!TEMP_KEY!
    echo API key set for this session.
    echo.
)

REM Check if requirements are installed
python -c "import flask" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Dependencies are not installed.
    echo Please run install.bat first.
    endlocal
    exit /b 1
)

echo Starting AI Agent...
echo.
echo The application will open in a new window.
echo Press Ctrl+C in this window to stop the application.
echo.

REM Start the application
python main.py

endlocal
