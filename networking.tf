resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

	tags = {
	Name = "Main"
	}
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "P-AV1" {
 	 vpc_id = aws_vpc.main.id
 	 cidr_block = "10.0.1.0/24"
	 availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "P-AV1"
  }
}

resource "aws_subnet" "P-AV2" {
         vpc_id = aws_vpc.main.id
         cidr_block = "10.0.2.0/24"
         availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "P-AV2"
  }
}

resource "aws_internet_gateway" "GW" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "GW"
  }
}

resource "aws_route_table" "RT-Subnet" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.GW.id
  }
	tags = {
	Name = "RT-Subnet"
	}
}
