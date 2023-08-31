resource "aws_vpc" "vpc" {
  cidr_block           = var.network_vpc_cidr_block
  enable_dns_hostnames = "true"
}

resource "aws_internet_gateway" "vpc_pub_igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "sn_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.network_sn_public_cidr_block
  availability_zone       = var.network_sn_public_zone
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_pub_igw.id
  }
}

resource "aws_route_table_association" "rt_public_sn_public" {
  subnet_id      = aws_subnet.sn_public.id
  route_table_id = aws_route_table.rt_public.id
}

