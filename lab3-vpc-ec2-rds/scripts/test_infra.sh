#!/bin/bash
# Script rapido per testare l'infrastruttura creata

echo "Verifica EC2 Bastion..."
BASTION_IP=$1
ping -c 4 $BASTION_IP

echo "Verifica RDS Endpoint..."
RDS_ENDPOINT=$2
nc -zv $RDS_ENDPOINT 3306
