resource "aws_instance" "appserver" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.keypair_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  subnet_id                   = aws_subnet.subnet_public.id
  associate_public_ip_address = true

  tags = {
    Name = "AppServer"
  }
  user_data = file("./resources/init.sh")
}
