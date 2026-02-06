# GCP Linux Health Monitoring

This repo helps you set up a Linux VM in Google Cloud Platform (GCP), practice user and group management, and prepare scripts for health monitoring.

## Contents

- `gcp_vm_setup.sh`: Bash script to provision a VM on GCP using the CLI.
- `linux_user_group_mgmt.sh`: Script for creating/deleting users and groups on Linux.
- `diagrams/`: Architecture diagrams.
- Step-by-step usage instructions.

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

---

## Resources

- [Google Cloud SDK Documentation](https://cloud.google.com/sdk/docs)
- [Linux User Management Guide](https://linuxize.com/post/how-to-create-users-in-linux/)

