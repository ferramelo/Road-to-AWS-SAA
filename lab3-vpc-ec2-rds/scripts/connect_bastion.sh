#!/bin/bash
# Connessione SSH al Bastion Host usando output Terraform

# Percorso chiave privata
KEY_PATH="tuo percorso"

# Recupera l'IP pubblico del Bastion dall'output Terraform
BASTION_IP=$(terraform output -raw bastion_public_ip)

if [ -z "$BASTION_IP" ]; then
  echo "Errore: impossibile recuperare l'IP pubblico del Bastion. Esegui 'terraform apply' prima."
  exit 1
fi

echo "Connessione a Bastion Host $BASTION_IP..."
ssh -i $KEY_PATH ubuntu@$BASTION_IP
