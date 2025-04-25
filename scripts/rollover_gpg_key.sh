#!/bin/bash
set -euo pipefail

echo "=== GitOps GPG Key Rollover Helper ==="

echo "Generating new GPG key..."
gpg --full-generate-key

echo "List of available GPG keys:"
gpg --list-keys

echo "IMPORTANT: Please manually set the new signing key in Git with:"
echo "  git config --global user.signingkey <NEW-KEY-ID>"
echo ""
echo "Then commit a signed 'key rollover' notice to the GitOps repository if desired."
