configure_mat2_cleaner_netvm:
  cmd.run:
    - name: "qvm-prefs mat2-cleaner netvm none"
    - unless: "qvm-prefs mat2-cleaner netvm | grep none"

configure_mat2_cleaner_firewall:
  cmd.run:
    - name: "qvm-firewall mat2-cleaner flush"
    - unless: "qvm-firewall mat2-cleaner list | grep deny"

create_cleaned_folder:
  cmd.run:
    - name: "mkdir -p /home/user/Cleaned"
    - user: user
    - unless: "test -d /home/user/Cleaned"
