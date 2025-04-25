configure_work_vault_netvm:
  cmd.run:
    - name: "qvm-prefs work-vault netvm none"
    - unless: "qvm-prefs work-vault netvm | grep none"

configure_work_vault_firewall:
  cmd.run:
    - name: "qvm-firewall work-vault flush"
    - unless: "qvm-firewall work-vault list | grep deny"

create_vault_folder:
  cmd.run:
    - name: "mkdir -p /home/user/Vault"
    - user: user
    - unless: "test -d /home/user/Vault"
