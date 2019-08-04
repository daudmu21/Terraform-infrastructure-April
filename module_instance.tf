module "wordpress" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 3.0"

  name                   = "wordpress"
  instance_count         = 3

  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"
  monitoring             = true
  vpc_security_group_ids = ["${aws_security_group.Public.id}"]
  subnet_id              = "${aws_subnet.public.id}"

  tags = {
    Name = "${var.Name}"
    Env = "${var.Env}"
    Created_by = "${var.Created_by}"
    Dept = "${var.Dept}"
  }
}