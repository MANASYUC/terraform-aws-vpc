resource "aws_vpc_endpoint" "vpc_endpoint" {
    vpc_id = aws_vpc.main.id
    service_name = "com.amazonaws.us-east-1.s3"

    route_table_ids = [ aws_route_table.nat_gw_1.id, 
                        aws_route_table.nat_gw_2.id]

    tags = {
      Name = "vpc-endpoint-s3"
    }
}