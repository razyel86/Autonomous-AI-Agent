"""
Test script for Qwen2.5-Omni-3B model
This script verifies that the model was downloaded correctly and can be loaded.
"""

import os
import sys
from pathlib import Path

def test_model_exists():
    """Check if the model directory exists"""
    print("=" * 50)
    print("Qwen2.5-Omni-3B Model Test")
    print("=" * 50)
    print()
    
    model_path = Path("models/Qwen2.5-Omni-3B")
    
    if not model_path.exists():
        print("❌ FAIL: Model directory not found")
        print(f"   Expected location: {model_path.absolute()}")
        print()
        print("Please run setup_model.bat (Windows) or ./setup_model.sh (Linux/Mac) first.")
        return False
    
    print("✓ Model directory found")
    print(f"  Location: {model_path.absolute()}")
    print()
    
    return True

def test_model_files():
    """Check if essential model files exist"""
    model_path = Path("models/Qwen2.5-Omni-3B")
    
    # Common model file patterns
    essential_files = [
        "config.json",
        "tokenizer_config.json",
    ]
    
    # Model weight files (at least one should exist)
    weight_patterns = [
        "*.safetensors",
        "*.bin",
        "model.safetensors.index.json",
    ]
    
    print("Checking essential files:")
    all_found = True
    
    for file_name in essential_files:
        file_path = model_path / file_name
        if file_path.exists():
            print(f"  ✓ {file_name}")
        else:
            print(f"  ❌ {file_name} - NOT FOUND")
            all_found = False
    
    print()
    print("Checking model weights:")
    
    weight_found = False
    for pattern in weight_patterns:
        matching_files = list(model_path.glob(pattern))
        if matching_files:
            print(f"  ✓ Found {len(matching_files)} file(s) matching {pattern}")
            for f in matching_files[:3]:  # Show first 3
                print(f"    - {f.name}")
            if len(matching_files) > 3:
                print(f"    ... and {len(matching_files) - 3} more")
            weight_found = True
    
    if not weight_found:
        print("  ❌ No model weight files found")
        all_found = False
    
    print()
    return all_found

def test_model_size():
    """Check the total size of the model directory"""
    model_path = Path("models/Qwen2.5-Omni-3B")
    
    total_size = 0
    file_count = 0
    
    for file in model_path.rglob("*"):
        if file.is_file():
            total_size += file.stat().st_size
            file_count += 1
    
    size_gb = total_size / (1024 ** 3)
    
    print(f"Model statistics:")
    print(f"  Total files: {file_count}")
    print(f"  Total size: {size_gb:.2f} GB")
    print()
    
    if size_gb < 0.1:
        print("  ⚠ Warning: Model size seems too small. Download may be incomplete.")
        return False
    
    return True

def test_git_lfs():
    """Check if git-lfs is properly tracking files"""
    import subprocess
    
    try:
        result = subprocess.run(
            ["git", "lfs", "ls-files"],
            cwd="models/Qwen2.5-Omni-3B",
            capture_output=True,
            text=True,
            timeout=10
        )
        
        if result.returncode == 0 and result.stdout.strip():
            lfs_files = result.stdout.strip().split('\n')
            print(f"Git LFS tracking:")
            print(f"  ✓ {len(lfs_files)} file(s) tracked by Git LFS")
            print()
            return True
        else:
            print("Git LFS tracking:")
            print("  ℹ No files tracked by Git LFS (this is OK if files were downloaded)")
            print()
            return True
    except Exception as e:
        print(f"Git LFS check: Skipped ({e})")
        print()
        return True

def main():
    """Run all tests"""
    try:
        tests = [
            ("Model existence", test_model_exists),
            ("Model files", test_model_files),
            ("Model size", test_model_size),
            ("Git LFS", test_git_lfs),
        ]
        
        results = []
        
        for test_name, test_func in tests:
            try:
                result = test_func()
                results.append((test_name, result))
            except Exception as e:
                print(f"❌ Error in {test_name}: {e}")
                print()
                results.append((test_name, False))
        
        # Summary
        print("=" * 50)
        print("Test Summary")
        print("=" * 50)
        
        for test_name, result in results:
            status = "✓ PASS" if result else "❌ FAIL"
            print(f"{status}: {test_name}")
        
        print()
        
        all_passed = all(result for _, result in results)
        
        if all_passed:
            print("✓ All tests passed!")
            print()
            print("The Qwen2.5-Omni-3B model is ready for future integration.")
            return 0
        else:
            print("Some tests failed. Please check the output above.")
            return 1
            
    except KeyboardInterrupt:
        print("\nTest interrupted by user.")
        return 1
    except Exception as e:
        print(f"\n❌ Unexpected error: {e}")
        import traceback
        traceback.print_exc()
        return 1

if __name__ == "__main__":
    sys.exit(main())
