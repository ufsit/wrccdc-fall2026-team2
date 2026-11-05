apt-get update
apt-get install -y auditd
tee /etc/audit/audit.rules <<EOF
-D
-a exit,always -F arch=b64 -S connect -k NETWORKCONN
EOF
tee /etc/audit/rules.d/audit.rules <<EOF
-D
-a exit,always -F arch=b64 -S connect -k NETWORKCONN
EOF
systemctl restart auditd
