#!/bin/bash
# Connessione SSH al Bastion Host
# Usa la chiave privata lab3-key.pem

BASTION_IP=$1

if [ -z "$BASTION_IP" ]; then
  echo "Usage: ./connect_bastion.sh <BASTION_PUBLIC_IP>"
  exit 1
fi

ssh -i lab3-key.pem ubuntu@$BASTION_IP
