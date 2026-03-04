#!/bin/bash

# Script to create GitHub release with model file
# This bypasses Git LFS and makes the file downloadable

set -e

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$SCRIPT_DIR"
MODEL_FILE="gemma3-1b-it-int4.task"

echo "🚀 Creating GitHub Release for Edge Models"
echo "=========================================="
echo ""

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed"
    echo "Install it: brew install gh"
    echo ""
    echo "OR create release manually:"
    echo "1. Go to: https://github.com/OpenChoices/edge-models/releases/new"
    echo "2. Tag: v1.0.0"
    echo "3. Title: Models v1.0"
    echo "4. Upload: gemma3-1b-it-int4.task"
    echo "5. Click 'Publish release'"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "⚠️  Not authenticated with GitHub"
    echo "Run: gh auth login"
    exit 1
fi

cd "$REPO_DIR"

# Check if model file exists
if [ ! -f "$MODEL_FILE" ]; then
    echo "❌ Model file not found: $MODEL_FILE"
    echo "Please ensure the file exists in: $REPO_DIR"
    exit 1
fi

echo "📦 Creating release v1.0.0..."
echo ""

# Create release and upload model
gh release create v1.0.0 \
  --title "Models v1.0 - Gemma 3 1B INT4" \
  --notes "Initial release with Gemma 3 1B INT4 model (529MB)

- Model: Gemma 3 1B Instruction-Tuned
- Size: 529MB
- Quantization: INT4 (optimized for mobile)
- Format: MediaPipe .task file" \
  "$MODEL_FILE"

echo ""
echo "✅ Release created successfully!"
echo ""
echo "📥 Download URL:"
echo "https://github.com/OpenChoices/edge-models/releases/download/v1.0.0/gemma3-1b-it-int4.task"
echo ""
echo "✅ Your app is already configured to use this URL!"
echo "   Just rebuild and install the APK."

