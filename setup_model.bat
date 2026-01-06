@echo off
REM Setup script for downloading Qwen2.5-Omni-3B model from Hugging Face

echo ========================================
echo Qwen2.5-Omni-3B Model Setup
echo ========================================
echo.

REM Check if git-lfs is installed
git lfs version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: git-lfs is not installed.
    echo Please install git-lfs first from https://git-lfs.github.com/
    exit /b 1
)

REM Initialize git-lfs
echo Initializing git-lfs...
git lfs install

REM Create models directory if it doesn't exist
if not exist "models" mkdir models
cd models

REM Check if model already exists
if exist "Qwen2.5-Omni-3B" (
    echo Model directory already exists. Skipping download.
    echo To re-download, delete the models\Qwen2.5-Omni-3B directory first.
    exit /b 0
)

REM Clone the model repository
echo.
echo Cloning Qwen2.5-Omni-3B model from Hugging Face...
echo This may take a while depending on your internet connection...
echo.

git clone https://huggingface.co/Qwen/Qwen2.5-Omni-3B

echo.
echo ========================================
echo Model download completed successfully!
echo Model location: models\Qwen2.5-Omni-3B
echo ========================================
