# internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "main-igw"
    }
}

#-----------------#
#   elastic id's 
#-----------------#

# elastic id 1
resource "aws_eip" "nat_eip1" {
    domain = "vpc"
}

# elastic id 2
resource "aws_eip" "nat_eip2" {
    domain = "vpc"
}

#-----------------#
#   nat gateways 
#-----------------#

# public nat gateway 1
resource "aws_nat_gateway" "nat_gw_1" {
    allocation_id = aws_eip.nat_eip1.id
    subnet_id = aws_subnet.public_1.id

    tags = {
      Name = "main-nat-gw1"
    }
}

# public nat gateway 2
resource "aws_nat_gateway" "nat_gw_2" {
    allocation_id = aws_eip.nat_eip2.id
    subnet_id = aws_subnet.public_2.id

    tags = {
      Name = "main-nat-gw2"
    }
}