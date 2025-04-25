# Secure Metadata Scrubbing Infrastructure for Qubes OS

---

## 1. Overview

This repository provides a secure, reproducible, GitOps-driven Qubes OS infrastructure for automatically cleaning metadata from images using MAT2, enforced through disposable VMs, strict qrexec policies, and full GitOps management.

**Core Principles:**
- Security-first (least privilege, disposable-based).
- Infrastructure-as-Code with SaltStack.
- User-space reproducibility with Nix Flakes.
- Fully auditable and manually-controlled GitOps flow.
- User-friendly desktop integration and automation.

---

## 2. System Architecture Diagram

```plaintext
[user selects file]
    |
    v (desktop launcher / right-click)
[proxy-cleaner-dvm] (DisposableVM, send via qrexec RPC)
    |
    v
[mat2-cleaner-dvm] (DisposableVM, MAT2 cleaning, notify, auto-shutdown)
    |
    v
[work-vault] (Persistent storage, cleaned images)
    |
    v (optional manual upload)
[upload-anon] (Whonix-ws over Tor, GUI confirmation before upload)



## 3. Repo structure

GitOps-MAT2-Qubes/
├── README.md
├── salt/
│   ├── top.sls
│   ├── mat2_cleaner/
│   │   ├── init.sls
│   ├── proxy_cleaner/
│   │   ├── init.sls
│   ├── work_vault/
│   │   ├── init.sls
│   ├── qubes/
│   │   ├── configure_proxy_cleaner.sls
│   │   ├── configure_mat2_cleaner.sls
│   │   ├── configure_work_vault.sls
│   │   ├── configure_rpc_cleanimage.sls
│   │   ├── my.CleanImage (auto-clean, notify, shutdown)
├── nix/
│   ├── mat2_cleaner/
│   │   ├── flake.nix
│   │   ├── watch_mat2.sh
├── policy/
│   ├── 30-mat2-cleaner.policy
│   ├── 31-upload-anon.policy
│   ├── 50-clean-image.policy
├── scripts/
│   ├── bootstrap_gitops.sh
│   ├── deploy.sh
│   ├── setup_rpc.sh (client + Desktop integration)
├── upload/
│   ├── confirm_upload.sh (GUI prompt before upload)
├── security/
│   ├── hardening.md
│   ├── audit-checklist.md
└── .gitignore
