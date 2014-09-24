base:
    '*':
        - git
    'os:Ubuntu':
        - match: grain
        - vim
    'os:Windows':
        - match: grain
        - npp
    '^dev.mobile':
        - android
