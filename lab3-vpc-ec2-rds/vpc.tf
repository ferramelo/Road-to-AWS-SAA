resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = { Name = "lab3-vpc" }
}

# Subnet pubblica per Bastion
resource "aws_subnet" "public" {
  vpc_id                   = aws_vpc.main.id
  cidr_block               = var.public_subnet_cidr
  map_public_ip_on_launch  = true
  availability_zone        = "eu-central-1a"
  tags = { Name = "PublicSubnet" }
}

# Subnet
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"  # subnet privata 1
  availability_zone = "eu-central-1a"
  tags = {
    Name = "PrivateSubnet1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"  # subnet privata 2, CIDR diverso!
  availability_zone = "eu-central-1b"
  tags = {
    Name = "PrivateSubnet2"
  }
}


# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "IGW" }
}

# Route table pubblica
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "PublicRouteTable" }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
