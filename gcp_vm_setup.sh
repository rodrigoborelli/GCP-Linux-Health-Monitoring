#!/bin/bash
# Script: gcp_vm_setup.sh
# Purpose: Provision a basic Linux VM in GCP using CLI tools (gcloud)

# Set variables
PROJECT_ID="your-gcp-project-id"
ZONE="us-central1-a"
INSTANCE_NAME="sre-linux-vm"
MACHINE_TYPE="e2-medium"
IMAGE_FAMILY="ubuntu-2004-lts"
IMAGE_PROJECT="ubuntu-os-cloud"

echo "Setting project..."
gcloud config set project $PROJECT_ID

echo "Creating VM instance..."
gcloud compute instances create $INSTANCE_NAME \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --image-family=$IMAGE_FAMILY \
    --image-project=$IMAGE_PROJECT \
    --tags=http-server,https-server \
    --boot-disk-size=20GB

echo "VM Created! To SSH into your instance:"
echo "gcloud compute ssh $INSTANCE_NAME --zone $ZONE"

# Notes:
# - Change PROJECT_ID to your actual project ID before running.
# - Adjust MACHINE_TYPE and IMAGE_FAMILY as needed.
