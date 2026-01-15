# Qwen2.5-Omni-3B Model Setup

This directory contains scripts to download the Qwen2.5-Omni-3B model from Hugging Face.

## About Qwen2.5-Omni-3B

Qwen2.5-Omni-3B is a multimodal AI model developed by Alibaba Cloud that can process both text and images. It's part of the Qwen (Tongyi Qianwen) series of large language models.

## Prerequisites

Before running the setup script, ensure you have:

1. **Git LFS (Large File Storage)** installed:
   - **Ubuntu/Debian**: `sudo apt-get install git-lfs`
   - **macOS**: `brew install git-lfs`
   - **Windows**: Download from [https://git-lfs.github.com/](https://git-lfs.github.com/)

2. **Sufficient disk space**: The model requires approximately 6-8 GB of storage.

3. **Stable internet connection**: The download may take significant time depending on your connection speed.

## Installation

### Windows

Run the batch script:
```powershell
setup_model.bat
```

### Linux/Mac

Run the bash script:
```bash
./setup_model.sh
```

## Model Location

After successful installation, the model will be located at:
```
models/Qwen2.5-Omni-3B/
```

## Re-downloading

If you need to re-download the model:

1. Delete the existing model directory:
   ```bash
   rm -rf models/Qwen2.5-Omni-3B
   ```

2. Run the setup script again

## Troubleshooting

### Git LFS not installed
If you see an error about git-lfs not being found, install it using the instructions in the Prerequisites section above.

### Download interrupted
If the download is interrupted, the git clone will resume from where it left off when you run the script again.

### Permission denied (Linux/Mac)
If you get a permission denied error, make sure the script is executable:
```bash
chmod +x setup_model.sh
```

## Model Usage

> **Note**: This model download is currently optional for future development. The Autonomous AI Agent currently uses Google's Gemini API for AI-powered assistance. 
> 
> **When to download this model:**
> - If you want to prepare for upcoming local inference features
> - If you're interested in experimenting with the Qwen model independently
> - If you plan to contribute to integrating local model support
>
> **Future benefits** (once integration is complete):
> - No dependency on external API services
> - Privacy: All processing done locally
> - No API costs or rate limits
> - Faster response times (with appropriate hardware)
> - Offline operation capability

## More Information

For more details about the Qwen2.5-Omni-3B model, visit:
- Hugging Face Model Page: [https://huggingface.co/Qwen/Qwen2.5-Omni-3B](https://huggingface.co/Qwen/Qwen2.5-Omni-3B)
- Qwen GitHub: [https://github.com/QwenLM/Qwen](https://github.com/QwenLM/Qwen)
