resource "aws_instance" "e2e_server" {
  ami                         = "ami-0b0af3577fe5e3532"
  instance_type               = "t2.micro"
  key_name                    = "admin1"
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  subnet_id                   = aws_subnet.publicsubnet.id
  associate_public_ip_address = true
  tags = {
    Name = "e2e-server"
  }
}


#  /*network_interface {
#   network_interface_id = aws_network_interface.nic.id
#   device_index         = 0
#  }*/
