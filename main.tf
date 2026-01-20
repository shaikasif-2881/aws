
provider "aws" {
  region = "us-east-1"
}

# -------------------------
# VPC
# -------------------------
resource "aws_vpc" "example1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}

# -------------------------
# Subnet
# -------------------------
resource "aws_subnet" "example_subnet" {
  vpc_id            = aws_vpc.example1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "example-subnett"
  }
}
resource "aws_instance" "example" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.example_subnet.id

  tags = {
    Name = "dev-server"
  }
}










