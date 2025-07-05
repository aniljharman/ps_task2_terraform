resource "aws_vpc" "main" { ... }
resource "aws_internet_gateway" "gw" { ... }
resource "aws_subnet" "public" { ... }
resource "aws_route_table" "public" { ... }
resource "aws_route" "public_internet" { ... }
resource "aws_route_table_association" "public_assoc" { ... }
