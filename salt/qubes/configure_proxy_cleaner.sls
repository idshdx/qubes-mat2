configure_proxy_cleaner_netvm:
  cmd.run:
    - name: "qvm-prefs proxy-cleaner netvm none"
    - unless: "qvm-prefs proxy-cleaner netvm | grep none"

configure_proxy_cleaner_firewall:
  cmd.run:
    - name: "qvm-firewall proxy-cleaner flush"
    - unless: "qvm-firewall proxy-cleaner list | grep deny"
