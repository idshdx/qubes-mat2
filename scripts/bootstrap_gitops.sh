#!/bin/bash
set -euo pipefail

echo "Starting GitOps Salt master bootstrap setup for Qubes OS..."

GITOPS_REPO_DIR="$HOME/GitOps-MAT2-Qubes"

if [ ! -d "$GITOPS_REPO_DIR" ]; then
    echo "Error: GitOps repository not found in $GITOPS_REPO_DIR"
    exit 1
fi

echo "Copying Salt states into /srv/salt..."
sudo mkdir -p /srv/salt/
sudo cp -r "$GITOPS_REPO_DIR/salt/"* /srv/salt/

echo "Copying Qrexec policies into /etc/qubes/policy.d..."
sudo cp "$GITOPS_REPO_DIR/policy/"*.policy /etc/qubes/policy.d/

echo "Setting permissions on /srv/salt..."
sudo chown -R root:root /srv/salt
sudo chmod -R 755 /srv/salt

echo "Setting permissions on /etc/qubes/policy.d..."
sudo chown root:root /etc/qubes/policy.d/*.policy
sudo chmod 644 /etc/qubes/policy.d/*.policy

echo "Performing Salt dry-run (optional validation)..."
sudo qubesctl --all state.highstate test=True

echo "Done. Your GitOps Salt environment is ready."
echo "Next: Manually inspect /srv/salt and policies, then run:"
echo "sudo qubesctl --all state.highstate"
