install_tools:
  pkg.installed:
    - pkgs:
      - mat2
      - inotify-tools

deploy_script:
  file.managed:
    - name: /home/user/watch_mat2.sh
    - source: salt://mat2_cleaner/watch_mat2.sh
    - user: user
    - group: user
    - mode: '0755'

setup_autostart:
  file.append:
    - name: /home/user/.bashrc
    - text: |
        screen -dmS mat2_watcher ~/watch_mat2.sh
