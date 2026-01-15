#!/bin/bash
# Startup script for Autonomous AI Agent
# This script starts the AI Agent application

set -e

echo "========================================"
echo "Autonomous AI Agent - Starting"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed."
    echo "Please run ./install.sh first."
    exit 1
fi

# Check if GEMINI_API_KEY is set
if [ -z "$GEMINI_API_KEY" ]; then
    echo "Warning: GEMINI_API_KEY environment variable is not set."
    echo ""
    echo "The application requires a Gemini API key to function."
    echo "You can set it with:"
    echo "  export GEMINI_API_KEY=\"your-api-key-here\""
    echo "  (Add to ~/.bashrc or ~/.zshrc for persistence)"
    echo ""
    read -p "Enter your Gemini API key (or press Enter to exit): " TEMP_KEY
    if [ -z "$TEMP_KEY" ]; then
        echo "Exiting..."
        exit 1
    fi
    export GEMINI_API_KEY="$TEMP_KEY"
    echo "API key set for this session."
    echo ""
fi

# Check if requirements are installed
python3 -c "import flask" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Dependencies are not installed."
    echo "Please run ./install.sh first."
    exit 1
fi

echo "Starting AI Agent..."
echo ""
echo "The application will open in a new window."
echo "Press Ctrl+C in this terminal to stop the application."
echo ""

# Start the application
python3 main.py
