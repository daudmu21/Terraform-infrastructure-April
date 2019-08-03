resource "aws_security_group" "Dev" {
  name        = "Dev"
  description = "Allow TLS inbound traffic"
  vpc_id      = "${aws_vpc.Dev.id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = ["pl-12c4e678"]
  }
}