@echo off
REM Setup script for downloading Qwen2.5-Omni-3B model from Hugging Face

setlocal

echo ========================================
echo Qwen2.5-Omni-3B Model Setup
echo ========================================
echo.

REM Check if git-lfs is installed
git lfs version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: git-lfs is not installed.
    echo Please install git-lfs first from https://git-lfs.github.com/
    endlocal
    exit /b 1
)

REM Initialize git-lfs
echo Initializing git-lfs...
git lfs install

REM Create models directory if it doesn't exist
if not exist "models" (
    mkdir models
    if %errorlevel% neq 0 (
        echo Error: Failed to create models directory
        endlocal
        exit /b 1
    )
)

REM Verify models directory exists before entering
if not exist "models" (
    echo Error: Models directory does not exist
    endlocal
    exit /b 1
)

REM Change to models directory
pushd models
if %errorlevel% neq 0 (
    echo Error: Failed to enter models directory
    endlocal
    exit /b 1
)

REM Check if model already exists
if exist "Qwen2.5-Omni-3B" (
    echo Model directory already exists. Skipping download.
    echo To re-download, delete the models\Qwen2.5-Omni-3B directory first.
    popd
    endlocal
    exit /b 0
)

REM Clone the model repository
echo.
echo Cloning Qwen2.5-Omni-3B model from Hugging Face...
echo This may take a while depending on your internet connection...
echo.

git clone https://huggingface.co/Qwen/Qwen2.5-Omni-3B
if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo Error: Failed to clone the model repository
    echo Please check your internet connection and try again
    echo ========================================
    popd
    endlocal
    exit /b 1
)

popd

echo.
echo ========================================
echo Model download completed successfully!
echo Model location: models\Qwen2.5-Omni-3B
echo ========================================

endlocal
