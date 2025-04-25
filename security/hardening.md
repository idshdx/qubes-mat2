# Template Hardening for GitOps MAT2 Cleaner

- Use minimal Debian templates.
- Remove unneeded services: avahi, cups, rpcbind, bluetooth.
- Disable automatic updates (to prevent unexpected package drift).
- Set `netvm` to `none` for all non-upload VMs.
- Flush firewall rules for `work-vault`.

Additionally:
- Restrict all qrexec communications via specific policies.
- Validate Git repository with GPG signed commits if possible.
