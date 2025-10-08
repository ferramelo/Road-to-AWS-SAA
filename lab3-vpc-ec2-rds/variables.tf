variable "aws_region" { 
  default = "eu-central-1"                      # Regione AWS predefinita (Francoforte) per la creazione delle risorse
}

variable "vpc_cidr" { 
  default = "10.0.0.0/16"                       # CIDR block della VPC; definisce l’intervallo di indirizzi IP privati disponibili
}

variable "public_subnet_cidr" { 
  default = "10.0.1.0/24"                       # CIDR per la subnet pubblica, tipicamente per risorse con IP pubblico come il Bastion
}

variable "private_subnet1_cidr" { 
  default = "10.0.2.0/24"                       # CIDR per la prima subnet privata, usata per risorse isolate come database o backend
}

variable "private_subnet2_cidr" { 
  default = "10.0.3.0/24"                       # CIDR per la seconda subnet privata, utile per alta disponibilità o separazione logica delle risorse
}

variable "bastion_ami" { 
  default = "ami-0b104d881e3078545"             # ID AMI per la Bastion host, in questo caso un’immagine Ubuntu aggiornata specifica per la regione
}

variable "bastion_instance_type" { 
  default = "t3.micro"                          # Tipo di istanza EC2 per la Bastion, dimensione piccola e a basso costo
}

variable "db_username" { 
  default = "admin"                             # Username di accesso al database RDS
}

variable "db_password" { 
  default = "ChangeMe123!"                      # Password iniziale per il database, va modificata in produzione per motivi di sicurezza
}

variable "my_ip_cidr" { 
  default = "158.47.227.0/24"                   # CIDR del proprio indirizzo IP pubblico o range, per limitare accesso SSH al Bastion
}
