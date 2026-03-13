#!/usr/bin/env bash

if [[ -z "$1" ]]; then
  echo "Missing application name...";
  echo "example:"
  echo "./mklog.sh my-application-name"
  exit 1
fi

app_name=$1;
logrotate_conf="/etc/logrotate.d/$app_name.conf";
log_file="/var/log/$app_name.log"

touch "$logrotate_conf" &&
touch "$log_file" &&
chmod 666 "$log_file" &&
cat << EOF > "$logrotate_conf"
$log_file {
    weekly
    size 100M
    minsize 100M
    rotate 10
    notifempty
    missingok
    compress
    delaycompress
    copytruncate
}
EOF &&
echo "The conf file is located at $logrotate_conf";
echo "The log can be found at $log_file";
echo "Stream the logs using tail. Example:"
echo "\$ tail -f $log_file";
echo "";
echo "or using grep to filter for errors:";
echo "\$ tail -f $log_file | grep -e [ERROR]"
echo "You can do it!";
