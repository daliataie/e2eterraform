
resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.e2e_vpc.id
  tags = {
    Name = "vpc"
  }
}