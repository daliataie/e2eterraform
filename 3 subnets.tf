# creating 3 subnets (privatesubnet/isolated-private-subnet, publicsubnet/publicsub, and nated subnet/NAT-DB-Subnet) in us-east-1a availability zone 

#1-privatesubnet/isolated-private-subnet
resource "aws_subnet" "privatesubnet" {
  vpc_id            = aws_vpc.e2e_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "isolated-private-subnet"
  }
}

#2- publicsubnet/publicsub
resource "aws_subnet" "publicsubnet" {
  vpc_id            = aws_vpc.e2e_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "publicsub"
  }
}
#3-nated subnet/NAT-DB-Subnet
resource "aws_subnet" "nated" {
  vpc_id            = aws_vpc.e2e_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "NAT-DB-Subnet"
  }
}


