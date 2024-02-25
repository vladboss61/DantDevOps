#!/bin/bash

chmod +x /home/varvashenko/check_disk_utilization.sh

crontab -e

# Put to cron config file. Monitor once per hour.
# 0 * * * * /home/varvashenko/check_disk_utilization.sh
