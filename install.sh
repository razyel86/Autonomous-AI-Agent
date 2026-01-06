#!/bin/bash
# Installation script for Autonomous AI Agent
# This script installs all required dependencies

set -e

echo "========================================"
echo "Autonomous AI Agent - Installation"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed."
    echo "Please install Python 3.8 or higher."
    exit 1
fi

echo "Python found:"
python3 --version
echo ""

# Check Python version
python3 -c "import sys; exit(0 if sys.version_info >= (3, 8) else 1)" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Python 3.8 or higher is required."
    exit 1
fi

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "Error: pip is not installed."
    echo "Please install pip or reinstall Python with pip included."
    exit 1
fi

echo "Installing dependencies..."
echo ""

# Install requirements
if pip3 install -r requirements.txt; then
    echo ""
    echo "========================================"
    echo "Installation completed successfully!"
    echo ""
    echo "Next steps:"
    echo "1. Set GEMINI_API_KEY environment variable"
    echo "   export GEMINI_API_KEY=\"your-api-key-here\""
    echo "   (Add to ~/.bashrc or ~/.zshrc for persistence)"
    echo ""
    echo "2. (Optional) Download Qwen model:"
    echo "   ./setup_model.sh"
    echo ""
    echo "3. Start the application:"
    echo "   ./start.sh"
    echo "========================================"
else
    echo ""
    echo "========================================"
    echo "Error: Failed to install dependencies"
    echo "Please check the error messages above"
    echo "========================================"
    exit 1
fi
