resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.cluster_vpc.id

    tags = {
      Name = format("%s-internet-gateway", var.cluster_name)
    }
  
}

resource "aws_route_table" "igw_route_table" {
    vpc_id = aws_vpc.cluster_vpc.id

    tags = {
      Name = format("%s-public-route", var.cluster_name)
    }
  
}

resource "aws_route" "public_internet_access" {
    route_table_id = aws_route_table.igw_route_table.id

    destination_cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.gw.id
  
}

resource "aws_route_table_association" "public_1a" {
    subnet_id = aws_subnet.public_subnet_1a.id
    route_table_id = aws_route_table.igw_route_table.id
  
}

resource "aws_route_table_association" "public_1c" {
    subnet_id = aws_subnet.public_subnet_1c.id
    route_table_id = aws_route_table.igw_route_table.id
  
}