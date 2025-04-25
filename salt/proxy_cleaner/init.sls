harden_proxy_cleaner:
  pkg.removed:
    - pkgs:
      - avahi-daemon
      - cups
      - rpcbind
      - bluetooth
      - modemmanager

configure_network:
  cmd.run:
    - name: "qvm-prefs proxy-cleaner netvm none"
    - unless: "qvm-prefs proxy-cleaner netvm | grep none"
