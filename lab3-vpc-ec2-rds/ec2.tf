resource "aws_instance" "bastion" {
  ami                    = var.bastion_ami                     # ID dell'immagine AMI da usare per la Bastion host, gestita come variabile
  instance_type          = var.bastion_instance_type           # Tipo di istanza EC2 (esempio: t2.micro), gestito come variabile
  subnet_id              = aws_subnet.public.id                # ID della subnet pubblica in cui lanciare la Bastion host
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]  # Lista di security group associati all’istanza; qui si fa riferimento al security group specifico per Bastion
  key_name               = "lab3-key"                          # Nome della key pair usata per SSH sull’istanza

  associate_public_ip_address = true                           # Assegna automaticamente un IP pubblico all’istanza per l’accesso remoto

  tags = { Name = "BastionHost" }                              # Tag dell’istanza per identificazione e gestione su AWS (console, cost management, ecc.)
}


