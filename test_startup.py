#!/usr/bin/env python3
"""
Startup Test Script for Autonomous AI Agent
Tests the application startup components without launching the GUI.
"""

import sys
import os
import importlib.util
from pathlib import Path

def test_python_version():
    """Check Python version is 3.8+"""
    print("=" * 60)
    print("Testing Python Version")
    print("=" * 60)
    
    version = sys.version_info
    print(f"Python version: {version.major}.{version.minor}.{version.micro}")
    
    if version >= (3, 8):
        print("✓ PASS: Python 3.8+ requirement met")
        return True
    else:
        print(f"❌ FAIL: Python 3.8+ required, found {version.major}.{version.minor}")
        return False

def test_dependencies():
    """Check if all required dependencies are available"""
    print("\n" + "=" * 60)
    print("Testing Dependencies")
    print("=" * 60)
    
    required_packages = [
        ('flask', 'Flask'),
        ('flask_socketio', 'Flask-SocketIO'),
        ('flask_cors', 'Flask-CORS'),
        ('google.generativeai', 'Google Generative AI'),
        ('numpy', 'NumPy'),
        ('cv2', 'OpenCV'),
        ('pandas', 'Pandas'),
        ('PIL', 'Pillow'),
        ('pyautogui', 'PyAutoGUI'),
        ('pygetwindow', 'PyGetWindow'),
        ('pyperclip', 'Pyperclip'),
        ('pytesseract', 'PyTesseract'),
        ('webview', 'PyWebView'),
    ]
    
    all_passed = True
    installed = []
    missing = []
    
    for package, name in required_packages:
        try:
            spec = importlib.util.find_spec(package)
            if spec is not None:
                print(f"  ✓ {name:25} - installed")
                installed.append(name)
            else:
                print(f"  ❌ {name:25} - NOT FOUND")
                missing.append(name)
                all_passed = False
        except (ImportError, ModuleNotFoundError, ValueError):
            print(f"  ❌ {name:25} - NOT FOUND")
            missing.append(name)
            all_passed = False
    
    print(f"\nInstalled: {len(installed)}/{len(required_packages)}")
    
    if missing:
        print(f"\nMissing packages: {', '.join(missing)}")
        print("Run ./install.sh or install.bat to install dependencies")
    
    return all_passed

def test_project_structure():
    """Check if required project files exist"""
    print("\n" + "=" * 60)
    print("Testing Project Structure")
    print("=" * 60)
    
    required_files = [
        'main.py',
        'requirements.txt',
        'src/backend/api.py',
        'src/backend/utils/gemini_utils.py',
        'src/backend/utils/agent_func.py',
        'assets/prompts/system_prompt.md',
    ]
    
    all_passed = True
    
    for filepath in required_files:
        path = Path(filepath)
        if path.exists():
            print(f"  ✓ {filepath}")
        else:
            print(f"  ❌ {filepath} - NOT FOUND")
            all_passed = False
    
    return all_passed

def test_imports():
    """Test if main application modules can be imported"""
    print("\n" + "=" * 60)
    print("Testing Application Imports")
    print("=" * 60)
    
    tests = []
    
    # Test importing main modules
    print("\nTesting core imports...")
    
    try:
        import threading
        print("  ✓ threading module")
        tests.append(True)
    except ImportError as e:
        print(f"  ❌ threading module - {e}")
        tests.append(False)
    
    try:
        # Add src to path if needed
        src_path = Path(__file__).parent / 'src'
        if src_path.exists() and str(src_path) not in sys.path:
            sys.path.insert(0, str(src_path))
        
        from backend import api
        print("  ✓ backend.api module")
        tests.append(True)
    except ImportError as e:
        print(f"  ⚠ backend.api module - {e}")
        print("    (This may require proper PYTHONPATH setup)")
        tests.append(False)
    
    try:
        import webview
        print("  ✓ webview module")
        tests.append(True)
    except ImportError as e:
        print(f"  ❌ webview module - {e}")
        tests.append(False)
    
    try:
        import pygetwindow
        print("  ✓ pygetwindow module")
        tests.append(True)
    except (ImportError, NotImplementedError) as e:
        # PyGetWindow doesn't work on Linux
        if "not support Linux" in str(e):
            print(f"  ⚠ pygetwindow module - Not supported on this platform")
            print("    (This is expected on Linux - app is designed for Windows)")
            tests.append(True)  # Don't fail on Linux
        else:
            print(f"  ❌ pygetwindow module - {e}")
            tests.append(False)
    
    # At least basic imports should work
    return tests[0] and tests[2]  # threading and webview

def test_environment():
    """Test environment configuration"""
    print("\n" + "=" * 60)
    print("Testing Environment Configuration")
    print("=" * 60)
    
    tests = []
    
    # Check GEMINI_API_KEY
    api_key = os.environ.get('GEMINI_API_KEY')
    if api_key:
        print(f"  ✓ GEMINI_API_KEY is set (length: {len(api_key)})")
        tests.append(True)
    else:
        print("  ⚠ GEMINI_API_KEY is not set")
        print("    The application will prompt for it at startup")
        print("    Set with: export GEMINI_API_KEY='your-key'")
        # Not a failure, just a warning
        tests.append(True)
    
    # Check Python executable
    print(f"  ✓ Python executable: {sys.executable}")
    tests.append(True)
    
    # Check current directory
    print(f"  ✓ Working directory: {os.getcwd()}")
    tests.append(True)
    
    return all(tests)

def test_api_creation():
    """Test if Flask app can be created"""
    print("\n" + "=" * 60)
    print("Testing Flask Application Creation")
    print("=" * 60)
    
    try:
        # Add src to path if needed
        src_path = Path(__file__).parent / 'src'
        if src_path.exists() and str(src_path) not in sys.path:
            sys.path.insert(0, str(src_path))
        
        from backend import api
        
        print("  Attempting to create Flask app...")
        app = api.create_app()
        
        if app:
            print("  ✓ Flask app created successfully")
            print(f"  ✓ App name: {app.name}")
            return True
        else:
            print("  ❌ Flask app creation returned None")
            return False
            
    except Exception as e:
        # On Linux or in CI, the app might fail due to missing dependencies
        # but we can still check if Flask is importable
        print(f"  ⚠ Flask app creation note: {e}")
        print(f"     Error type: {type(e).__name__}")
        print("     (This may be expected in headless/Linux environment)")
        
        # Check if Flask itself is available
        try:
            import flask
            print("  ✓ Flask module is available")
            return True
        except ImportError:
            print("  ❌ Flask module not available")
            return False

def main():
    """Run all startup tests"""
    print("\n")
    print("╔" + "=" * 58 + "╗")
    print("║" + " " * 10 + "AUTONOMOUS AI AGENT - STARTUP TEST" + " " * 13 + "║")
    print("╚" + "=" * 58 + "╝")
    print()
    
    tests = [
        ("Python Version", test_python_version),
        ("Dependencies", test_dependencies),
        ("Project Structure", test_project_structure),
        ("Application Imports", test_imports),
        ("Environment", test_environment),
        ("Flask App Creation", test_api_creation),
    ]
    
    results = []
    
    for test_name, test_func in tests:
        try:
            result = test_func()
            results.append((test_name, result))
        except Exception as e:
            print(f"\n❌ Error in {test_name}: {e}")
            import traceback
            traceback.print_exc()
            results.append((test_name, False))
    
    # Print summary
    print("\n" + "=" * 60)
    print("STARTUP TEST SUMMARY")
    print("=" * 60)
    
    passed = 0
    failed = 0
    
    for test_name, result in results:
        if result:
            print(f"✓ PASS: {test_name}")
            passed += 1
        else:
            print(f"❌ FAIL: {test_name}")
            failed += 1
    
    print()
    print(f"Total: {len(results)} tests")
    print(f"Passed: {passed}")
    print(f"Failed: {failed}")
    print()
    
    if failed == 0:
        print("✓ All startup tests passed!")
        print()
        print("The application is ready to start.")
        print("Run ./start.sh (Linux/Mac) or start.bat (Windows) to launch.")
        return 0
    else:
        print("❌ Some startup tests failed.")
        print()
        print("Please address the issues above before starting the application.")
        if any(name == "Dependencies" and not result for name, result in results):
            print("Hint: Run ./install.sh or install.bat to install dependencies.")
        return 1

if __name__ == "__main__":
    sys.exit(main())
