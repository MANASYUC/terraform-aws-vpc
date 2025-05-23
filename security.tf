resource "aws_security_group" "security_g" {
    name = "security-g"
    description = "allows incoming traffic to access SSH and HTTPS"
    vpc_id = aws_vpc.main.id

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
    }

    ingress{
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "security-group-ssh-https"
    }
}

