# GitOps-MAT2-Qubes: Security and Key Management Policy

---

## GPG Key Management Policy

- A GPG key dedicated to signing Git commits and tags is generated and stored inside a Split-GPG vault Qube.
- The key is never exported or exposed outside the vault.
- All Git commits MUST be signed using the authorized GPG key.
- GPG key rollover occurs every 12-24 months or upon suspected compromise.

---

## Key Rollover Procedure

1. Generate a new GPG key inside the vault:
   ```bash
   gpg --full-generate-key

2. Update Git signing configuration in GitOps qubes:
    ```
    git config --global user.signingkey <new-key-id>
3. Sign a "key rollover" commit or notice with both old and new keys (optional).
4. Update documentation to reflect new key.
5. Deactivate old key if needed after verification period.
