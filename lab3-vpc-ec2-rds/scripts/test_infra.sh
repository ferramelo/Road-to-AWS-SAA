#!/bin/bash
# Test rapido infrastruttura EC2 + RDS

# Recupera output Terraform
BASTION_IP=$(terraform output -raw bastion_public_ip)
RDS_ENDPOINT=$(terraform output -raw rds_endpoint)

echo "Verifica EC2 Bastion..."
ping -c 4 $BASTION_IP

echo "Verifica RDS Endpoint (porta 3306)..."
nc -zv $RDS_ENDPOINT 3306
