#!/bin/bash

# Exit the script on any error
set -e

# Update the package list and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

# Install Git
echo "Installing Git..."
sudo apt install git -y

# Install AWS CLI
echo "Installing AWS CLI..."

# Install prerequisites for AWS CLI
sudo apt install unzip curl -y

# Download the latest version of AWS CLI version 2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the downloaded file
unzip awscliv2.zip

# Install AWS CLI
sudo ./aws/install

# Verify AWS CLI installation
aws --version

# Install Terraform
echo "Installing Terraform..."

# Install prerequisites
sudo apt install software-properties-common -y

# Add the HashiCorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the HashiCorp official Linux repository
sudo apt update && sudo apt install terraform -y

# Verify Terraform installation
terraform -version

# Clean up
echo "Cleaning up..."
rm -f awscliv2.zip
sudo rm -rf aws/

echo "Installation completed successfully!"
