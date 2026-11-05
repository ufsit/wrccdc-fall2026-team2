apt-get update
apt-get install timeshift python3 -y
tee /etc/timeshift/timeshift.json <<EOF
{
  "backup_device_uuid" : "",
  "do_first_run" : "true",
  "btrfs_mode" : "false",
  "stop_cron_emails" : "true",
  "schedule_monthly" : "false",
  "schedule_weekly" : "false",
  "schedule_daily" : "true",
  "schedule_hourly" : "true",
  "schedule_boot" : "true",
  "count_monthly" : "1",
  "count_weekly" : "1",
  "count_daily" : "2",
  "count_hourly" : "12",
  "count_boot" : "12",
  "exclude" : [
    "/root/**",
    "/home/**"
  ],
  "exclude-apps" : []
}
EOF
timeshift --create --comments "Fresh install" --tags B,H --snapshot-device {df -Pk / | awk 'NR==2 {print $1}'}
