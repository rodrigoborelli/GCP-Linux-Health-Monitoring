#!/bin/bash
# Script: health_monitor.sh
# Purpose: Basic system health monitoring (SRE-style)
# Author: Your Name
# Date: 2026-02-06
LOG_DIR="./logs"
LOG_FILE="$LOG_DIR/system_health.log"
# Thresholds (SRE defines these based on SLOs)
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80
mkdir -p $LOG_DIR
timestamp=$(date "+%Y-%m-%d %H:%M:%S")
# CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
# Memory usage
MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')
# Disk usage (root partition)
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
# Load average
LOAD_AVG=$(uptime | awk -F'load average:' '{ print $2 }')
# Log output
echo "[$timestamp] CPU=${CPU_USAGE}% MEM=${MEM_USAGE}% DISK=${DISK_USAGE}% LOAD=${LOAD_AVG}" >> $LOG_FILE
# Alerts
if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
  echo "[$timestamp] ALERT: High CPU usage (${CPU_USAGE}%)" >> $LOG_FILE
fi
if [ "$MEM_USAGE" -ge "$MEM_THRESHOLD" ]; then
  echo "[$timestamp] ALERT: High Memory usage (${MEM_USAGE}%)" >> $LOG_FILE
fi
if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
  echo "[$timestamp] ALERT: High Disk usage (${DISK_USAGE}%)" >> $LOG_FILE
fi
