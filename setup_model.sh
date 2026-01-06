#!/bin/bash
# Setup script for downloading Qwen2.5-Omni-3B model from Hugging Face

set -e

echo "========================================"
echo "Qwen2.5-Omni-3B Model Setup"
echo "========================================"
echo ""

# Check if git-lfs is installed
if ! command -v git-lfs &> /dev/null; then
    echo "Error: git-lfs is not installed."
    echo "Please install git-lfs first:"
    echo "  - Ubuntu/Debian: sudo apt-get install git-lfs"
    echo "  - macOS: brew install git-lfs"
    echo "  - Windows: Download from https://git-lfs.github.com/"
    exit 1
fi

# Initialize git-lfs
echo "Initializing git-lfs..."
git lfs install

# Store original directory
ORIGINAL_DIR=$(pwd)

# Create models directory if it doesn't exist
mkdir -p models
cd models

# Check if model already exists
if [ -d "Qwen2.5-Omni-3B" ]; then
    echo "Model directory already exists. Skipping download."
    echo "To re-download, delete the models/Qwen2.5-Omni-3B directory first."
    cd "$ORIGINAL_DIR"
    exit 0
fi

# Clone the model repository
echo ""
echo "Cloning Qwen2.5-Omni-3B model from Hugging Face..."
echo "This may take a while depending on your internet connection..."
echo ""

git clone https://huggingface.co/Qwen/Qwen2.5-Omni-3B

cd "$ORIGINAL_DIR"

echo ""
echo "========================================"
echo "Model download completed successfully!"
echo "Model location: models/Qwen2.5-Omni-3B"
echo "========================================"
