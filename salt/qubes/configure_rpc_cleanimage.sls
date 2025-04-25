{% set rpc_file = "/etc/qubes-rpc/my.CleanImage" %}

install_rpc_service:
  file.managed:
    - name: {{ rpc_file }}
    - source: salt://qubes/my.CleanImage
    - user: root
    - group: root
    - mode: '0755'

create_cleaned_dir:
  cmd.run:
    - name: "mkdir -p /home/user/Cleaned"
    - user: user
    - unless: "test -d /home/user/Cleaned"
