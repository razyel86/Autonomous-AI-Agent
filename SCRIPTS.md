# Scripts Documentation

This document provides detailed information about all the utility scripts included in the Autonomous AI Agent project.

## Overview

The project includes several automation scripts to simplify installation, setup, and testing:

| Script | Platform | Purpose |
|--------|----------|---------|
| `install.bat` | Windows | Install Python dependencies |
| `install.sh` | Linux/Mac | Install Python dependencies |
| `start.bat` | Windows | Start the AI Agent application |
| `start.sh` | Linux/Mac | Start the AI Agent application |
| `setup_model.bat` | Windows | Download Qwen2.5-Omni-3B model |
| `setup_model.sh` | Linux/Mac | Download Qwen2.5-Omni-3B model |
| `test_model.bat` | Windows | Test model installation |
| `test_model.sh` | Linux/Mac | Test model installation |
| `test_startup.bat` | Windows | Test application startup components |
| `test_startup.sh` | Linux/Mac | Test application startup components |

## Installation Scripts

### install.bat / install.sh

These scripts automate the installation of all required Python dependencies.

**Features:**
- Verifies Python 3.8+ is installed
- Checks pip availability
- Installs all packages from `requirements.txt`
- Provides clear error messages if something goes wrong
- Shows next steps after successful installation

**Usage:**

Windows:
```powershell
install.bat
```

Linux/Mac:
```bash
./install.sh
```

**What it does:**
1. Checks Python version (requires 3.8+)
2. Verifies pip is available
3. Runs `pip install -r requirements.txt`
4. Displays next steps including API key setup

## Startup Scripts

### start.bat / start.sh

These scripts start the AI Agent application with proper environment checks.

**Features:**
- Verifies Python is installed
- Checks if GEMINI_API_KEY is set (prompts if not)
- Verifies dependencies are installed
- Starts the Flask server and webview application

**Usage:**

Windows:
```powershell
start.bat
```

Linux/Mac:
```bash
./start.sh
```

**What it does:**
1. Checks Python installation
2. Verifies GEMINI_API_KEY environment variable
3. Prompts for API key if not set (temporary for session)
4. Checks if dependencies are installed
5. Runs `python main.py`

**Setting API Key Permanently:**

Windows:
```powershell
setx GEMINI_API_KEY "your-api-key-here"
```

Linux/Mac:
```bash
export GEMINI_API_KEY="your-api-key-here"
# Add to ~/.bashrc or ~/.zshrc for persistence
echo 'export GEMINI_API_KEY="your-api-key-here"' >> ~/.bashrc
```

## Model Setup Scripts

### setup_model.bat / setup_model.sh

These scripts download the Qwen2.5-Omni-3B model from Hugging Face.

**Features:**
- Verifies git-lfs is installed
- Checks if model already exists (skips re-download)
- Clones model repository from Hugging Face
- Robust error handling
- Shows progress and status messages

**Usage:**

Windows:
```powershell
setup_model.bat
```

Linux/Mac:
```bash
./setup_model.sh
```

**What it does:**
1. Checks git-lfs installation
2. Initializes git-lfs
3. Creates `models/` directory
4. Clones `https://huggingface.co/Qwen/Qwen2.5-Omni-3B`
5. Reports success or failure

**Prerequisites:**
- Git LFS must be installed
- Stable internet connection
- 6-8 GB of free disk space

See [MODEL_SETUP.md](MODEL_SETUP.md) for detailed model setup documentation.

## Model Testing Scripts

### test_model.bat / test_model.sh / test_model.py

These scripts verify that the Qwen2.5-Omni-3B model was downloaded correctly.

**Features:**
- Checks if model directory exists
- Verifies essential model files (config.json, tokenizer files)
- Checks for model weight files (.safetensors, .bin)
- Reports model size and file count
- Checks Git LFS tracking
- Provides detailed test results

**Usage:**

Windows:
```powershell
test_model.bat
```

Linux/Mac:
```bash
./test_model.sh
```

**What it tests:**
1. **Model Existence**: Checks if `models/Qwen2.5-Omni-3B/` exists
2. **Model Files**: Verifies config.json and tokenizer files
3. **Model Weights**: Checks for .safetensors or .bin files
4. **Model Size**: Ensures model size is reasonable (> 0.1 GB)
5. **Git LFS**: Verifies LFS tracking (informational)

**Example Output:**
```
==================================================
Qwen2.5-Omni-3B Model Test
==================================================

✓ Model directory found
  Location: /path/to/models/Qwen2.5-Omni-3B

Checking essential files:
  ✓ config.json
  ✓ tokenizer_config.json

Checking model weights:
  ✓ Found 2 file(s) matching *.safetensors
    - model-00001-of-00002.safetensors
    - model-00002-of-00002.safetensors

Model statistics:
  Total files: 15
  Total size: 6.42 GB

==================================================
Test Summary
==================================================
✓ PASS: Model existence
✓ PASS: Model files
✓ PASS: Model size
✓ PASS: Git LFS

✓ All tests passed!

The Qwen2.5-Omni-3B model is ready for future integration.
```

## Startup Testing Scripts

### test_startup.bat / test_startup.sh / test_startup.py

These scripts verify that the application components are ready for startup without actually launching the GUI.

**Features:**
- Tests Python version (3.8+ requirement)
- Verifies all 13 dependencies are installed
- Checks project file structure
- Tests module imports
- Validates environment configuration
- Confirms Flask readiness

**Usage:**

Windows:
```powershell
test_startup.bat
```

Linux/Mac:
```bash
./test_startup.sh
```

**What it tests:**
1. **Python Version**: Ensures Python 3.8+ is installed
2. **Dependencies**: Verifies all 13 packages from requirements.txt
3. **Project Structure**: Checks for 6 essential files
4. **Application Imports**: Tests core module imports
5. **Environment**: Validates GEMINI_API_KEY and paths
6. **Flask App**: Confirms Flask framework is ready

**Example Output (Success):**
```
╔==========================================================╗
║          AUTONOMOUS AI AGENT - STARTUP TEST             ║
╚==========================================================╝

============================================================
STARTUP TEST SUMMARY
============================================================
✓ PASS: Python Version
✓ PASS: Dependencies
✓ PASS: Project Structure
✓ PASS: Application Imports
✓ PASS: Environment
✓ PASS: Flask App Creation

Total: 6 tests
Passed: 6
Failed: 0

✓ All startup tests passed!

The application is ready to start.
Run ./start.sh (Linux/Mac) or start.bat (Windows) to launch.
```

**Example Output (Failure):**
```
============================================================
Testing Dependencies
============================================================
  ❌ Flask                     - NOT FOUND
  ❌ Flask-SocketIO            - NOT FOUND
  ...

Missing packages: Flask, Flask-SocketIO, ...
Run ./install.sh or install.bat to install dependencies
```

See [STARTUP_TEST_REPORT.md](STARTUP_TEST_REPORT.md) for detailed test results.

## Complete Workflow

### First Time Setup

1. **Install dependencies:**
   ```bash
   # Windows
   install.bat
   
   # Linux/Mac
   ./install.sh
   ```

2. **Set API key:**
   ```bash
   # Windows
   setx GEMINI_API_KEY "your-api-key-here"
   
   # Linux/Mac
   export GEMINI_API_KEY="your-api-key-here"
   ```

3. **(Optional) Download model:**
   ```bash
   # Windows
   setup_model.bat
   
   # Linux/Mac
   ./setup_model.sh
   ```

4. **(Optional) Test model:**
   ```bash
   # Windows
   test_model.bat
   
   # Linux/Mac
   ./test_model.sh
   ```

5. **(Optional) Test startup:**
   ```bash
   # Windows
   test_startup.bat
   
   # Linux/Mac
   ./test_startup.sh
   ```

6. **Start the application:**
   ```bash
   # Windows
   start.bat
   
   # Linux/Mac
   ./start.sh
   ```

### Daily Usage

After initial setup, you only need:

```bash
# Windows
start.bat

# Linux/Mac
./start.sh
```

## Troubleshooting

### "Python is not installed"
- Install Python 3.8 or higher from [python.org](https://www.python.org/)
- Make sure Python is added to your PATH

### "pip is not installed"
- Reinstall Python with pip included
- Or install pip separately: `python -m ensurepip`

### "git-lfs is not installed"
- **Windows**: Download from [git-lfs.github.com](https://git-lfs.github.com/)
- **Ubuntu/Debian**: `sudo apt-get install git-lfs`
- **macOS**: `brew install git-lfs`

### "GEMINI_API_KEY is not set"
- Get API key from [Google AI Studio](https://aistudio.google.com)
- Set it permanently (see instructions above)
- Or enter it when prompted by start script

### "Dependencies are not installed"
- Run the install script: `install.bat` or `./install.sh`

### Model download fails
- Check internet connection
- Verify git-lfs is installed and initialized
- Try running setup_model script again (it will resume)

### Model test fails
- Ensure model was downloaded: run `setup_model.bat` or `./setup_model.sh`
- Check disk space (model requires 6-8 GB)
- Review test output for specific missing files

## Script Exit Codes

All scripts return standard exit codes:
- `0`: Success
- `1`: Error/Failure

This allows them to be used in automated workflows:

```bash
# Example: Chain commands
./install.sh && ./setup_model.sh && ./start.sh

# Example: Conditional execution
if ./test_model.sh; then
    echo "Model is ready!"
else
    echo "Model needs setup"
    ./setup_model.sh
fi
```

## Contributing

When adding new scripts:
1. Create both `.bat` (Windows) and `.sh` (Linux/Mac) versions
2. Make shell scripts executable: `chmod +x script.sh`
3. Include error checking and helpful messages
4. Test on target platforms
5. Update this documentation
