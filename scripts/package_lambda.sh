#!/usr/bin/env bash
# Usage: package_lambda.sh <lambda_source_dir> <lambda_name>
# Example: package_lambda.sh mcp/developer_lambda developer_lambda
set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <lambda_source_dir> <lambda_name>" >&2
  exit 1
fi

LAMBDA_SRC="$1"
LAMBDA_NAME="$2"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LAMBDA_DIR="$ROOT_DIR/$LAMBDA_SRC"
BUILD_DIR="$ROOT_DIR/build/lambda/$LAMBDA_NAME"
PACKAGE_DIR="$BUILD_DIR/package"
ZIP_PATH="$ROOT_DIR/build/lambda/${LAMBDA_NAME}.zip"

rm -rf "$BUILD_DIR"
mkdir -p "$PACKAGE_DIR"

python -m pip install --upgrade pip --quiet
python -m pip install -r "$LAMBDA_DIR/requirements.txt" -t "$PACKAGE_DIR" --quiet

cp "$LAMBDA_DIR/handler.py" "$PACKAGE_DIR/handler.py"

(
  cd "$PACKAGE_DIR"
  zip -r "$ZIP_PATH" . -x "*.pyc" -x "__pycache__/*" > /dev/null
)

echo "ZIP_PATH=$ZIP_PATH"
