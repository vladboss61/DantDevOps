resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}


# Create NAT Gateway in public subnet
# resource "aws_nat_gateway" "nat_gateway" {
#   allocation_id = aws_eip.nat_eip.id
#   subnet_id     = aws_subnet.public.id
# }

# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.main.id
  
#   tags = {
#     Name = "private-route-table"
#   }
# }

# resource "aws_eip" "nat_eip" {
#   vpc = true
# }

# # Modify private subnet route table to route traffic through NAT Gateway
# resource "aws_route" "private_subnet_route" {
#   route_table_id            = aws_route_table.private.id
#   destination_cidr_block    = "0.0.0.0/0"
#   nat_gateway_id            = aws_nat_gateway.nat_gateway.id
# }

# # Associate private subnet with modified route table
# resource "aws_route_table_association" "private_subnet_association" {
#   subnet_id      = aws_subnet.private.id
#   route_table_id = aws_route_table.private.id
# }