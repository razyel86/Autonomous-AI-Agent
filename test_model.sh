#!/bin/bash
# Test script for Qwen2.5-Omni-3B model
# This script verifies that the model was downloaded correctly

set -e

echo "========================================"
echo "Qwen2.5-Omni-3B Model Test"
echo "========================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed."
    echo "Please install Python 3.8 or higher."
    exit 1
fi

# Run the test script
if python3 test_model.py; then
    echo ""
    echo "========================================"
    echo "Model test completed successfully!"
    echo "========================================"
    exit 0
else
    echo ""
    echo "========================================"
    echo "Model test failed!"
    echo "Please check the output above for details."
    echo "========================================"
    exit 1
fi
