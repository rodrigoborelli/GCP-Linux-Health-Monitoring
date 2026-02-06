#!/usr/bin/env python3
import os
import subprocess
from datetime import datetime
LOG_DIR = "logs"
LOG_FILE = f"{LOG_DIR}/system_health.log"
CPU_THRESHOLD = 80
MEM_THRESHOLD = 80
DISK_THRESHOLD = 80
os.makedirs(LOG_DIR, exist_ok=True)
def run(cmd):
    return subprocess.check_output(cmd, shell=True).decode().strip()
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
cpu = float(run("top -bn1 | grep 'Cpu(s)' | awk '{print 100 - $8}'"))
mem = float(run("free | awk '/Mem/ {printf(\"%.0f\", $3/$2 * 100)}'"))
disk = int(run("df / | awk 'NR==2 {print $5}' | sed 's/%//'"))
load = run("uptime | awk -F'load average:' '{ print $2 }'")
with open(LOG_FILE, "a") as f:
    f.write(f"[{timestamp}] CPU={cpu}% MEM={mem}% DISK={disk}% LOAD={load}\n")
    if cpu >= CPU_THRESHOLD:
        f.write(f"[{timestamp}] ALERT: High CPU usage ({cpu}%)\n")
    if mem >= MEM_THRESHOLD:
        f.write(f"[{timestamp}] ALERT: High Memory usage ({mem}%)\n")
    if disk >= DISK_THRESHOLD:
        f.write(f"[{timestamp}] ALERT: High Disk usage ({disk}%)\n")
