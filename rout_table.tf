resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.dev.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
      Name = "${var.Name}"
      Env = "${var.Env}"
      Created_by = "${var.Created_by}"
      Dept = "${var.Dept}"
  }
}