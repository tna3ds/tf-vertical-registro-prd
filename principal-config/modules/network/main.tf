# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE AN INTERNET GATEWAY
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    "Name"    = upper("igw-${var.project}-${var.environment}")
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A PUBLIC ROUTE TABLE
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_route_table" "rtb_pub" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name"    = upper("rtb-pub-${var.project}-${var.environment}")
    "Manager" = var.manager
  }
}
resource "aws_main_route_table_association" "main_pub" {
  vpc_id         = var.vpc_id
  route_table_id = aws_route_table.rtb_pub.id
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A PUBLIC SUBNETS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name      = upper("subnet-pub-${var.project}-${var.environment}-${var.azs_name[count.index]}")
    "Manager" = var.manager
  }
}
resource "aws_route_table_association" "public_route" {
  count          = length(var.public_subnets)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.rtb_pub.id
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A NAT GATEWAYS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_eip" "ipnat" {
  count = length(var.public_subnets)
  vpc   = true
  tags = {
    Name      = upper("eip-${var.project}-${var.environment}-${var.azs_name[count.index]}")
    "Manager" = var.manager
  }
}
resource "aws_nat_gateway" "natw" {
  count         = length(var.public_subnets)
  allocation_id = element(aws_eip.ipnat.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnets.*.id, count.index)
  tags = {
    Name      = upper("nat-${var.project}-${var.environment}-${var.azs_name[count.index]}")
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A PRIVATE ROUTE TABLES
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_route_table" "rtb_prv" {
  count  = length(var.private_subnets)
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.natw.*.id, count.index)
  }
  tags = {
    "Name"    = upper("rtb-prv-${var.project}-${var.environment}-${var.azs_name[count.index]}")
    "Manager" = var.manager
  }
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE A PRIVATE SUBNETS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "aws_subnet" "private_subnets" {
  count                   = length(var.private_subnets)
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnets[count.index]
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name      = upper("subnet-prv-${var.project}-${var.environment}-${var.azs_name[count.index]}")
    "Manager" = var.manager
  }
}
resource "aws_route_table_association" "private_route" {
  count          = length(var.private_subnets)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = element(aws_route_table.rtb_prv.*.id, count.index)
}
