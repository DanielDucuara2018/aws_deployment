resource "aws_vpc" "main_vpc" {
  cidr_block       = var.vpc_ip_range
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_ip_range_public
  availability_zone = "${var.region}a"
}

resource "aws_internet_gateway" "internet_service" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "terraform-internet-gateway"
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id     = aws_vpc.main_vpc.id
  depends_on = [aws_subnet.subnet_public]

  tags = {
    "Name" = "terraform-route-table-public"
  }
}

resource "aws_route_table_association" "route_table_attach_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route" "p_subnet_igw_route" {
  route_table_id         = aws_route_table.route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_service.id
  depends_on             = [aws_internet_gateway.internet_service]
}
