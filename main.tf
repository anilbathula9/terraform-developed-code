provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
  depends_on = [aws_s3_bucket.bucket]
}
resource "aws_subnet" "main-public" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main-public"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main-gw"
  }
}
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_vpc.id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main-route-table"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main-public.id
  route_table_id = aws_route_table.route_table.id
}
