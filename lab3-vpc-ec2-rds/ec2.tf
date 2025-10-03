resource "aws_instance" "bastion" {
  ami           = var.bastion_ami
  instance_type = var.bastion_instance_type
  subnet_id     = aws_subnet.public.id
  security_groups = [aws_security_group.bastion_sg.name]
  key_name = "lab3-key"

  tags = { Name = "BastionHost" }
}
