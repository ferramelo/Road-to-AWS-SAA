output "bastion_public_ip" {
  description = "IP pubblico del Bastion Host"            # Descrizione esplicativa dell’output, utile per capire cosa restituisce
  value       = aws_instance.bastion.public_ip            # Valore restituito: l’indirizzo IP pubblico dell’istanza EC2 chiamata "bastion"
}

output "rds_endpoint" {
  description = "Endpoint del database RDS"                # Descrizione per identificare chiaramente l’output
  value       = aws_db_instance.mysql.endpoint             # Valore restituito: hostname/endpoint dell’istanza DB RDS denominata "mysql"
}

