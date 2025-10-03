#!/bin/bash
# Connessione al database RDS MySQL tramite Bastion
# Richiede installazione di mysql client

BASTION_IP=$1
RDS_ENDPOINT=$2
DB_USER=$3
DB_PASS=$4
DB_NAME=$5

if [ -z "$BASTION_IP" ] || [ -z "$RDS_ENDPOINT" ]; then
  echo "Usage: ./connect_rds.sh <BASTION_IP> <RDS_ENDPOINT> <DB_USER> <DB_PASS> <DB_NAME>"
  exit 1
fi

ssh -i lab3-key.pem -L 3307:$RDS_ENDPOINT:3306 ubuntu@$BASTION_IP -N &
SSH_PID=$!

echo "Tunnel SSH aperto. Ora puoi connetterti al DB con:"
echo "mysql -h 127.0.0.1 -P 3307 -u $DB_USER -p$DB_PASS $DB_NAME"

read -p "Premi Enter per chiudere il tunnel..."
kill $SSH_PID
