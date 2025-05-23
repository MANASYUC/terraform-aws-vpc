# main vpc
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags ={
        Name = "main-vpc"
    }
}

#-----------------#
#   subnets 
#-----------------#

# public subnet 1
resource "aws_subnet" "public_1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags ={
        Name = "public-1"
    }
}

# public subnet 2
resource "aws_subnet" "public_2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"

    tags ={
        Name = "public-2"
    }
}

# private subnet 1
resource "aws_subnet" "private_1" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1a"

    tags ={
        Name = "private-1"
    }
}

# private subnet 2
resource "aws_subnet" "private_2" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-1b"

    tags ={
        Name = "private-2"
    }
}
