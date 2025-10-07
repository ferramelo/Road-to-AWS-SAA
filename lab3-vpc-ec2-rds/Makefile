# =========================================
# 🚀 Terraform Lab 3 - VPC + EC2 + RDS
# =========================================

# Variabili (modifica con i propri dati)
KEY_PATH=
REGION=
USER=

# Output (verrà popolato dopo apply)
BASTION_IP=$(shell terraform output -raw bastion_public_ip 2>/dev/null)
RDS_ENDPOINT=$(shell terraform output -raw rds_endpoint 2>/dev/null)

# =========================================
# 🔧 1. Inizializzazione Terraform
# =========================================
init:
	terraform init

# =========================================
# 🧩 2. Creazione del piano
# =========================================
plan:
	terraform plan

# =========================================
# 🚀 3. Deploy completo dell'infrastruttura
# =========================================
apply:
	terraform apply -auto-approve

# =========================================
# 🔍 4. Mostra gli output
# =========================================
output:
	terraform output

# =========================================
# 🧠 5. Connessione SSH al Bastion Host
# =========================================
connect-bastion:
	@if [ -z "$(BASTION_IP)" ]; then \
		echo "❌ Bastion IP non trovato. Esegui prima 'make output'"; \
	else \
		echo "🔐 Connessione a Bastion: $(BASTION_IP)"; \
		chmod 400 $(KEY_PATH); \
		ssh -i $(KEY_PATH) $(USER)@$(BASTION_IP); \
	fi

# =========================================
# 🧱 6. Tunnel SSH per accedere a RDS
# =========================================
tunnel-rds:
	@if [ -z "$(BASTION_IP)" ] || [ -z "$(RDS_ENDPOINT)" ]; then \
		echo "❌ Devi prima eseguire 'make apply' e 'make output' per ottenere gli endpoint."; \
	else \
		echo "🌉 Creazione tunnel SSH verso RDS..."; \
		echo "Comando attivo: ssh -i $(KEY_PATH) -L 3306:$(RDS_ENDPOINT):3306 $(USER)@$(BASTION_IP)"; \
		ssh -i $(KEY_PATH) -L 3306:$(RDS_ENDPOINT):3306 $(USER)@$(BASTION_IP); \
	fi

# =========================================
# 🧪 7. Test connessione MySQL (dopo tunnel)
# =========================================
mysql-test:
	mysql -h 127.0.0.1 -P 3306 -u admin -p

# =========================================
# 💣 8. Distruzione completa
# =========================================
destroy:
	terraform destroy -auto-approve

# =========================================
# 📊 9. Monitoraggio e logs
# =========================================
logs:
	@echo "📈 Apri AWS CloudWatch per vedere metriche EC2/RDS"
	@echo "🔍 Puoi attivare i VPC Flow Logs nella console VPC"

# =========================================
# 🧹 10. Pulizia file locali
# =========================================
clean:
	rm -rf .terraform terraform.tfstate* .terraform.lock.hcl
	@echo "🧹 Pulizia completata."
