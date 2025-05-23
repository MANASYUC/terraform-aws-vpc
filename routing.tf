resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "public-rt"
    }
}

resource "aws_route_table_association" "public_1" {
    route_table_id = aws_route_table.public_rt.id
    subnet_id = aws_subnet.public_1.id
}

resource "aws_route_table_association" "public_2" {
    route_table_id = aws_route_table.public_rt.id
    subnet_id = aws_subnet.public_2.id
}


resource "aws_route_table" "nat_gw_1" {
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw_1.id
    }

    tags = {
        Name = "nat-gw-1"
    }
}

resource "aws_route_table" "nat_gw_2" {
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw_2.id
    }

    tags = {
        Name = "nat-gw-2"
    }
}



resource "aws_route_table_association" "private_1" {
    route_table_id = aws_route_table.nat_gw_1.id
    subnet_id = aws_subnet.private_1.id
}

resource "aws_route_table_association" "private_2" {
    route_table_id = aws_route_table.nat_gw_2.id
    subnet_id = aws_subnet.private_2.id
}




