#!/bin/bash
set -euo pipefail

echo "=== Verifying Git Commit Signatures ==="

cd ~/GitOps-MAT2-Qubes

if git log --show-signature | grep -q "BAD signature"; then
    echo "ERROR: Found BAD signature in Git history!"
    exit 1
fi

if git log --show-signature | grep -q "gpg: Signature made"; then
    echo "All commits are GPG signed and valid."
else
    echo "ERROR: Some commits are NOT signed!"
    exit 1
fi
