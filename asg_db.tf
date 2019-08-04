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
  vpc_zone_identifier       = ["${aws_subnet.PrivateDB.id}"]
  health_check_type         = "EC2"
  min_size                  = "${var.min_size_db}"
  max_size                  = "${var.max_size_db}"
  desired_capacity          = "${var.desired_db_capacity}"
  wait_for_capacity_timeout = 0

  tags_as_map = {
    Name = "${var.Name}.mqsl"
    Env = "${var.Env}"
    Created_by = "${var.Created_by}"
    Dept = "${var.Dept}"
  }
}