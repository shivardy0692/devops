## main.tf
````sh
provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
} 
resource "aws_instance" "ec2_instance" {
  ami = "ami-0e159fc62d940d348"
  instance_type = "t2.micro"
  
  tags = {
    Name = "dev"
  }
}
````
## network.tf
````sh
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "EKS_VPC"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"  # Set your desired availability zone
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-south-1b"  # Set your desired availability zone
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnet2"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "EKS_IGW"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "EKS_RT"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "subnet1_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "subnet2_association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}
````
