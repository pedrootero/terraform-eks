resource "aws_subnet" "public_subnet_1a" {
    vpc_id = aws_vpc.cluster_vpc.id

    cidr_block = "10.0.0.0/20"
    map_public_ip_on_launch = true
    availability_zone = format("%sa",var.aws_region)

    tags = {
        "Name" = format("%s-public-1a", var.cluster_name)
    }
  
}

resource "aws_subnet" "public_subnet_1c" {
    vpc_id = aws_vpc.cluster_vpc.id

    cidr_block = "10.0.16.0/20"
    map_public_ip_on_launch = true
    availability_zone = format("%sa",var.aws_region)

    tags = {
        "Name" = format("%s-public-1c", var.cluster_name)
    }
  
}