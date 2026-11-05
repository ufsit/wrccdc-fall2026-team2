dnf install audit python3 -y
tee /etc/audit/audit.rules <<EOF
-D
-a exit,always -F arch=b64 -S connect -k NETWORKCONN
EOF
tee /etc/audit/rules.d/audit.rules <<EOF
-D
-a exit,always -F arch=b64 -S connect -k NETWORKCONN
EOF
service auditd reload
service auditd restart
