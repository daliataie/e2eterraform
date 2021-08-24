#1-local router
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.e2e_vpc.id
  route {
    cidr_block = "10.1.0.0/16"
    gateway_id = aws_internet_gateway.gateway.id
  }
  tags = {
    Name = "publicsubnet rout table"
  }
}
resource "aws_route_table_association" "associate_route_publicsubnet" {
  subnet_id      = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.route_table.id
}

#2-Nat router
resource "aws_route_table" "nated" {
  vpc_id = aws_vpc.e2e_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }
  tags = {
    Name = "Main Route Table for NAT-ed subnet"
  }
}
resource "aws_route_table_association" "nated" {
  subnet_id      = aws_subnet.nated.id
  route_table_id = aws_route_table.nated.id
}
#3-So private router
resource "aws_route_table" "my_so_private_router" {
  vpc_id = aws_vpc.e2e_vpc.id

  tags = {
    Name = "Local Route Table for Isolated Private Subnet"
  }
}
resource "aws_route_table_association" "my_soprivate_table_ass" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.my_so_private_router.id
}



/*resource "aws_route_table_association" "associate_route_privatesubnet" {
  subnet_id      = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.route_table.id
}
# i think no need to below since our rout table is already connected to gateway in 5
# resource "aws_route_table_association" "associate_route_gateway" {
#   gateway_id     = aws_internet_gateway.gateway.id
#   route_table_id = aws_route_table.route_table.id
# }*/