resource "aws_db_subnet_group" "main" {
  name       = "rds-subnet-group"                                # Nome identificativo del gruppo di subnet per RDS
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]  # Elenco degli ID delle subnet private dove sarà posizionato il DB RDS (alta disponibilità)
  tags       = { Name = "RDSSubnetGroup" }                       # Tag per identificare il gruppo di subnet in AWS
}

resource "aws_db_instance" "mysql" {
  allocated_storage    = 20                                      # Spazio di storage allocato in GB per il database
  engine               = "mysql"                                 # Tipo di motore DB (MySQL)
  engine_version       = "8.0"                                   # Versione specifica del motore MySQL
  instance_class       = "db.t3.micro"                           # Tipo di istanza DB, con risorse e costo limitati (adatto per ambienti di test o piccoli carichi)
  username             = var.db_username                         # Username per l’accesso al database, passato come variabile
  password             = var.db_password                         # Password del database, gestita come variabile per sicurezza
  vpc_security_group_ids = [aws_security_group.rds_sg.id]        # Security group applicato all’istanza DB per regole di accesso in VPC
  db_subnet_group_name   = aws_db_subnet_group.main.name         # Configura il gruppo di subnet specificato sopra per posizionare il DB in subnet private
  skip_final_snapshot    = true                                  # Disabilita la creazione automatica di snapshot DB alla distruzione della risorsa (attenzione: perdita dati possibile)

  tags = { Name = "RDSMySQL" }                                   # Tag per identificare l’istanza DB nella console AWS e nei report costi
}
