aws_region            = "eu-central-1"           # Regione AWS dove vengono create le risorse (Francoforte)
vpc_cidr              = "10.0.0.0/16"            # CIDR della VPC principale, definisce il range IP privato
public_subnet_cidr    = "10.0.1.0/24"            # CIDR per subnet pubblica (risorse esposte su Internet)
private_subnet_cidr   = "10.0.2.0/24"            # CIDR per prima subnet privata (risorse protette)
private_subnet2_cidr  = "10.0.3.0/24"            # CIDR per seconda subnet privata (per alta disponibilità o separazione ulteriori)
bastion_ami           = "ami-0b104d881e3078545"  # ID AMI specifico per il Bastion Host (dipendente dalla regione)
bastion_instance_type = "t3.micro"                # Tipo di istanza EC2 per Bastion, piccola e a basso costo
db_username           = "admin"                   # Username iniziale per il database RDS
db_password           = "ChangeMe123!"            # Password iniziale (va cambiata in ambienti di produzione per sicurezza)
db_name               = "labdb"                   # Nome del database creato su RDS



