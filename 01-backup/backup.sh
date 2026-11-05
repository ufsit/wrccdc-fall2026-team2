mkdir -p /opt/bluebackup/
tar -czvf /opt/bluebackup/etc.tar.gz /etc
tar -czvf /opt/bluebackup/var-spool-cron.tar.gz /var/spool/cron
tar -czvf /opt/bluebackup/root.tar.gz /root
tar -czvf /opt/bluebackup/var-www.tar.gz /var/www
tar -czvf /opt/bluebackup/var-lib-mysql.tar.gz /var/lib/mysql
tar -czvf /opt/bluebackup/var-lib-pgsql.tar.gz /var/lib/pgsql
