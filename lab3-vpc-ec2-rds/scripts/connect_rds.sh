#!/bin/bash
# Connessione al database RDS MySQL tramite Bastion usando output Terraform

# Percorso chiave privata
KEY_PATH="tuo percorso"

# Recupera gli output Terraform
BASTION_IP=$(terraform output -raw bastion_public_ip)
RDS_ENDPOINT=$(terraform output -raw rds_endpoint)
DB_USER="admin"          # oppure var.db_username
DB_PASS="ChangeMe123!"   # oppure var.db_password
DB_NAME="labdb"          # oppure var.db_name

# Apri tunnel SSH verso RDS tramite Bastion
ssh -i $KEY_PATH -L 3307:$RDS_ENDPOINT:3306 ubuntu@$BASTION_IP -N &
SSH_PID=$!

echo "Tunnel SSH aperto. Ora puoi connetterti al DB con:"
echo "mysql -h 127.0.0.1 -P 3307 -u $DB_USER -p$DB_PASS $DB_NAME"

read -p "Premi Enter per chiudere il tunnel..."
kill $SSH_PID
