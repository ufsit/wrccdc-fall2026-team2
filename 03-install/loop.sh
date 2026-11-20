WEB=$(cat /root/base/webroot)
echo PORTS; ss -tuln | sort | diff /root/base/ports -
echo USERS; cut -d: -f1 /etc/passwd | diff /root/base/users -
echo SUID; find / -xdev -perm -4000 -type f 2>/dev/null | diff /root/base/suid -
echo SGID; find / -xdev -perm -2000 -type f 2>/dev/null | diff /root/base/sgid -
echo HASH; sha256sum -c /root/base/hash 2>&1 | grep -v OK
echo DIRS; ls -la /etc/sudoers.d /root/.ssh /home/*/.ssh 2>/dev/null | diff /root/base/dirs -
echo PRELOAD; ls /etc/ld.so.preload 2>/dev/null
echo CRON; ls -laR /etc/cron* /var/spool/cron* 2>/dev/null | diff /root/base/cron -
echo WEB; sha256sum -c /root/base/web 2>&1 | grep -v OK
echo NEWWEB; find $WEB -type f -newer /root/base/web 2>/dev/null
echo LOGINS; last -n 5
echo SESSIONS; w -h
