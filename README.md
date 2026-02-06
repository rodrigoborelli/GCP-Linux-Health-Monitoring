# GCP Linux Health Monitoring
This repository is part of **Month 1 of a 12‑Month Site Reliability Engineering (SRE) Study Plan**.  
It focuses on building strong **Linux fundamentals**, **basic automation**, and **system health monitoring** on a Google Cloud Platform (GCP) virtual machine.
---
## Contents
- `gcp_vm_setup.sh`  
  Bash script to provision a Linux VM in Google Cloud using the `gcloud` CLI.
- `linux_user_group_mgmt.sh`  
  Script demonstrating Linux user and group management operations.
- `health_monitor.sh`  
  Bash-based system health monitoring script.
- `health_monitor.py`  
  Python-based system health monitoring script (more extensible).
---

## Setup Instructions

### 1. Provision a VM in GCP

See [gcp_vm_setup.sh](./gcp_vm_setup.sh) for CLI commands.

**Steps:**
1. Authenticate using `gcloud init`.
2. Run the setup script.
3. SSH into your new VM.

### 2. User & Group Management

See [linux_user_group_mgmt.sh](./linux_user_group_mgmt.sh) for examples.

**Practice:**
- Create/delete users/groups.
- Assign users to groups.
- Modify file permissions.

### 3. System Health Monitoring
The health monitoring scripts collect key system signals that SREs commonly track to understand system reliability.

Monitored Signals
CPU usage
Memory usage
Disk usage (root filesystem)
Load average
Timestamp of execution Alerts are generated when predefined thresholds are exceeded.

3.1 Bash Health Monitoring
File: health_monitor.sh This script:

Collects system metrics using standard Linux tools
Applies threshold checks
Outputs alerts when limits are breached Run:

chmod +x health_monitor.sh
./health_monitor.sh

3.2 Python Health Monitoring
File: health_monitor.py This version provides the same functionality as the Bash script, but uses Python to enable:

Cleaner logic
Easier maintenance
Future integrations (e.g., Slack, email, monitoring systems) Run:

python3 health_monitor.py
---

## Resources

- [Google Cloud SDK Documentation](https://cloud.google.com/sdk/docs)
- [Linux User Management Guide](https://linuxize.com/post/how-to-create-users-in-linux/)

