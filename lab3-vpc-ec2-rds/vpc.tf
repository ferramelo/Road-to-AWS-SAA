# Creazione della VPC principale con CIDR definito da variabile
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr                               # CIDR block della VPC, es. "10.0.0.0/16"
  tags = { 
    Name = "lab3-vpc"                                     # Tag per identificare la VPC nella console AWS
  }
}

# -----------------------------
# Subnet pubblica (per Bastion)
# -----------------------------
resource "aws_subnet" "public" {
  vpc_id                   = aws_vpc.main.id              # Associa la subnet alla VPC creata sopra
  cidr_block               = var.public_subnet_cidr       # CIDR della subnet pubblica, es. "10.0.1.0/24"
  map_public_ip_on_launch  = true                         # Associa automaticamente un IP pubblico alle istanze lanciate in questa subnet
  availability_zone        = "eu-central-1a"              # Zona di disponibilità per la subnet

  tags = { 
    Name = "PublicSubnet"                                 # Tag identificativo della subnet pubblica
  }
}

# -----------------------------
# Prima Subnet Privata
# -----------------------------
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id                     # Associa alla stessa VPC
  cidr_block        = var.private_subnet1_cidr            # CIDR private subnet 1, es. "10.0.2.0/24"
  availability_zone = "eu-central-1a"                     # Zona di disponibilità (stessa della pubblica per semplicità)

  tags = { 
    Name = "PrivateSubnet1"                               # Tag identificativo subnet privata 1
  }
}

# -----------------------------
# Seconda Subnet Privata
# -----------------------------
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet2_cidr            # CIDR private subnet 2, es. "10.0.3.0/24"
  availability_zone = "eu-central-1b"                     # Zona di disponibilità differente per alta disponibilità

  tags = { 
    Name = "PrivateSubnet2"                               # Tag identificativo subnet privata 2
  }
}

# -----------------------------
# Internet Gateway
# -----------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id                                # Gateway per consentire accesso a Internet dalla VPC
  tags = { 
    Name = "IGW"                                          # Tag identificativo dell’Internet Gateway
  }
}

# -----------------------------
# Route Table Pubblica
# -----------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id                                # Tabella di routing associata alla VPC

  route {
    cidr_block = "0.0.0.0/0"                              # Rotta per tutto il traffico verso Internet
    gateway_id = aws_internet_gateway.igw.id              # Passa tramite l’Internet Gateway
  }

  tags = { 
    Name = "PublicRouteTable"                             # Tag per la tabella pubblica
  }
}

# Associazione route table pubblica → subnet pubblica
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id                   # Subnet pubblica a cui associare la route table
  route_table_id = aws_route_table.public.id              # ID della route table pubblica
}

# -----------------------------
# Route Table Privata (condivisa)
# -----------------------------
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = { 
    Name = "PrivateRouteTable"                            # Tabella di routing per le subnet private
  }
}

# Associazione → Subnet privata 1
resource "aws_route_table_association" "private1_assoc" {
  subnet_id      = aws_subnet.private1.id                 # Associa route table privata alla subnet privata 1
  route_table_id = aws_route_table.private.id
}

# Associazione → Subnet privata 2
resource "aws_route_table_association" "private2_assoc" {
  subnet_id      = aws_subnet.private2.id                 # Associa route table privata alla subnet privata 2
  route_table_id = aws_route_table.private.id
}

