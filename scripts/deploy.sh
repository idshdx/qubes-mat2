#!/bin/bash
set -euo pipefail

echo "Pulling latest GitOps repository..."
cd ~/GitOps-MAT2-Qubes/
git pull

echo "Applying Salt states..."
sudo qubesctl --all state.highstate

echo "Deployment complete."
