resource "aws_eip" "nat_gw_eip" {
  vpc = true
}
resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat_gw_eip.id
  subnet_id     = aws_subnet.publicsubnet.id
}


/*resource "aws_network_interface" "nic" {
  subnet_id       = aws_subnet.publicsubnet.id
  private_ips     = ["10.0.2.4"]
  security_groups = [aws_security_group.security_group.id]
}

# Attach Elastic IP to n/w interface -------Req. deployment of IGW first as well as the EC2 instance being setup first.
resource "aws_eip" "one" {
  vpc                       = true #wheteher in VPC or not
  network_interface         = aws_network_interface.nic.id
  associate_with_private_ip = "10.0.2.4"
  #depends_on = [aws_internet_gateway.gw, aws_instance.testIntance]
}*/
