install-rsync:
  cmd.run:
    - name: apt-get install -y xinetd

/etc/xinetd.d/rsync:
  file.managed:
    - source: salt://template/init_env/rsync/xinetd.rsync
    - user: root
    - group: root
    - mode: 600 
    - template: jinja

/etc/rsyncd.conf:
  file.managed:
    - source: salt://template/init_env/rsync/rsyncd.conf
    - user: root
    - group: root
    - mode: 600 
    - template: jinja

/etc/serverrsync.pass:
  file.managed:
    - source: salt://template/init_env/rsync/serverrsync.pass
    - user: root
    - group: root
    - mode: 600 
    - template: jinja

/etc/rsync.pass:
  file.managed:
    - source: salt://template/init_env/rsync/rsync.pass
    - user: root
    - group: root
    - mode: 600 
    - template: jinja

xinetd-rsync:
  cmd.run:
    - name: systemctl restart xinetd

