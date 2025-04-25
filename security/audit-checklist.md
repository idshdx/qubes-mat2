# Audit Checklist

Before Deployment:
- [ ] Verify Git commit signatures (optional but recommended).
- [ ] Manually review all Salt states.
- [ ] Manually review all policy files.
- [ ] Ensure no unexpected qrexec service exposure.
- [ ] Confirm templates have unnecessary services disabled.
- [ ] Confirm no qube has `netvm` except upload-anon.

Ongoing:
- [ ] Regularly update your MAT2, inotify-tools through templates.
- [ ] Review qrexec policies monthly.
- [ ] Backup Git repository securely (encrypted offline copy).
