output "bastion_public_ip" {
  description = "IP pubblico del Bastion Host"
  value       = aws_instance.bastion.public_ip
}

output "rds_endpoint" {
  description = "Endpoint del database RDS"
  value       = aws_db_instance.mysql.endpoint
}



