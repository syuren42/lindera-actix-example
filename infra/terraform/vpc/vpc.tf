
locals {
  az_1      = "ap-northeast-1a"
  az_2      = "ap-northeast-1c"
}

#####################################
# VPC Settings
#####################################

resource "aws_vpc" "research-vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "for-reserach"
  }
}

#####################################
# Public Subnets Settings
#####################################

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.research-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = local.az_1
  tags = {
    Name = "public-subnet1"
  }
}


resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.research-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = local.az_2
  tags = {
    Name = "public-subnet2"
  }
}

#####################################
# Internet gateway Settings
#####################################

resource "aws_internet_gateway" "research-vpc-igw" {
  vpc_id = aws_vpc.research-vpc.id
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.research-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.research-vpc-igw.id
  }
  tags = {
    Name = "reserach-vpc-public"
  }
}
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public.id
}


