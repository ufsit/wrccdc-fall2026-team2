umask 077
WEB=/var/www    # change to your real web root (Phase 6, Step 1)
mkdir -p /root/base
echo $WEB > /root/base/webroot
find / -xdev -perm -4000 -type f 2>/dev/null > /root/base/suid
find / -xdev -perm -2000 -type f 2>/dev/null > /root/base/sgid
sha256sum /etc/passwd /etc/shadow /etc/group /etc/sudoers /etc/ssh/sshd_config /etc/sudoers.d/* /root/.ssh/authorized_keys /home/*/.ssh/authorized_keys /root/.bashrc /home/*/.bashrc /etc/profile /etc/bashrc /etc/bash.bashrc /etc/ld.so.preload 2>/dev/null > /root/base/hash
find $WEB -type f -exec sha256sum {} + 2>/dev/null > /root/base/web
ss -tuln | sort > /root/base/ports
cut -d: -f1 /etc/passwd > /root/base/users
ls -laR /etc/cron* /var/spool/cron* > /root/base/cron 2>/dev/null
ls -la /etc/sudoers.d /root/.ssh /home/*/.ssh > /root/base/dirs 2>/dev/null
