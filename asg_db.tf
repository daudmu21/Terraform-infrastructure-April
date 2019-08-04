module "mysql" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "3.0"
  name = "mysql"

  # Launch configuration
  lc_name = "mysql-lc"

  image_id        = "${var.ami}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.PrivateDB.id}"]

  # Auto scaling group
  asg_name                  = "mysql-asg"
  vpc_zone_identifier       = ["${aws_subnet.Private.id}"]
  health_check_type         = "EC2"
  min_size                  = 6
  max_size                  = 128
  desired_capacity          = 6
  wait_for_capacity_timeout = 0

  tags_as_map = {
    Name = "${var.Name}.mqsl"
    Env = "${var.Env}"
    Created_by = "${var.Created_by}"
    Dept = "${var.Dept}"
  }
}