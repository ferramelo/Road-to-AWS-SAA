# Security Group per il Bastion Host
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"                              # Nome dello security group per il Bastion
  description = "Permette SSH al Bastion Host"            # Descrizione funzionale dello scopo dello SG
  vpc_id      = aws_vpc.main.id                           # Associa questo SG alla VPC principale

  ingress {
    from_port   = 22                                      # Permette traffico in ingresso sulla porta 22 (SSH)
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]                        # Accesso SSH consentito solo dalla rete IP specificata (es. rete privata o IP pubblico personale)
  }

  egress {
    from_port   = 0                                       # Permette traffico in uscita su qualsiasi porta e protocollo
    to_port     = 0
    protocol    = "-1"                                    # "-1" significa tutti i protocolli
    cidr_blocks = ["0.0.0.0/0"]                           # Traffico in uscita verso qualsiasi destinazione
  }
}

# Security Group per il database RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"                                  # Nome dello security group per RDS
  description = "Accesso al database solo dal Bastion"    # Descrizione che indica che solo il Bastion può accedere al DB
  vpc_id      = aws_vpc.main.id                           # Associa questo SG alla stessa VPC

  ingress {
    from_port       = 3306                                # Permette traffico in ingresso alla porta MYSQL (3306)
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]  # Consente solo il traffico proveniente dal security group del Bastion (restrizione di sicurezza)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]                           # Permette traffico in uscita verso qualsiasi destinazione
  }
}
