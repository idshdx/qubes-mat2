secure_vault:
  cmd.run:
    - name: "qvm-prefs work-vault netvm none && qvm-firewall work-vault flush"
    - unless: "qvm-prefs work-vault netvm | grep none"
