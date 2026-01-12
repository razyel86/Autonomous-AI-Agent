#!/bin/bash
# Startup test script for Autonomous AI Agent
# This script tests the startup components without launching the GUI

set -e

echo "========================================"
echo "Autonomous AI Agent - Startup Test"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed."
    echo "Please install Python 3.8 or higher."
    exit 1
fi

# Run the startup test
python3 test_startup.py

exit_code=$?

if [ $exit_code -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "Startup test completed successfully!"
    echo "========================================"
else
    echo ""
    echo "========================================"
    echo "Startup test failed!"
    echo "Please check the output above."
    echo "========================================"
fi

exit $exit_code
