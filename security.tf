resource "aws_security_group" "security_g" {
    name = "security-g"
    description = "allows incoming traffic to access SSH and HTTPS"
    vpc_id = aws_vpc.main.id

    ingress{
        from_port = 22                  # SSH
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]        # private subnets
    }

    ingress{
        from_port = 443                 # HTTPS
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0           #
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "security-group-ssh-https"
    }
}



resource "aws_network_acl" "nw_acl" {
    vpc_id = aws_vpc.main.id
    

    ingress{
        from_port = 22                  # SSH
        to_port = 22
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        cidr_block = "10.0.3.0/24"
    }

    ingress{
        from_port = 22                  # SSH
        to_port = 22
        protocol = "tcp"
        rule_no = 101
        action = "allow"
        cidr_block = "10.0.4.0/24"
        
    }

    ingress{
        from_port = 443                 # HTTPS
        to_port = 443
        protocol = "tcp"
        rule_no = 110
        action = "allow"
        cidr_block = "0.0.0.0/0"
        
    }

    egress{
        from_port = 0           
        to_port = 0
        protocol = "-1"
        rule_no = 100
        action = "allow"
        cidr_block = "0.0.0.0/0"
        
    }

    tags = {
      Name = "network-acl"
    }
}

resource "aws_network_acl_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  network_acl_id = aws_network_acl.nw_acl.id
}

resource "aws_network_acl_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  network_acl_id = aws_network_acl.nw_acl.id
}

resource "aws_network_acl_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  network_acl_id = aws_network_acl.nw_acl.id
}

resource "aws_network_acl_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  network_acl_id = aws_network_acl.nw_acl.id
}

