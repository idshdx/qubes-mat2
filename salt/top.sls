base:
  'proxy-cleaner':
    - proxy_cleaner
    - qubes.configure_proxy_cleaner

  'mat2-cleaner':
    - mat2_cleaner
    - qubes.configure_mat2_cleaner
    - qubes.configure_rpc_cleanimage

  'work-vault':
    - work_vault
    - qubes.configure_work_vault
