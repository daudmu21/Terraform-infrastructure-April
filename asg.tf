module "${var.appname}" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "3.0"
  
  name = "${var.appname}"

  # Launch configuration
  lc_name = "${var.appname}-lc"

  image_id        = "${var.ami}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.Public.id}"]

  # Auto scaling group
  asg_name                  = "${var.appname}-asg"
  vpc_zone_identifier       = ["${aws_subnet.public.id}"]
  health_check_type         = "EC2"
  min_size                  = 3
  max_size                  = 128
  desired_capacity          = 6
  wait_for_capacity_timeout = 0

  tags_as_map = {
    Name = "${var.Name}"
    Env = "${var.Env}"
    Created_by = "${var.Created_by}"
    Dept = "${var.Dept}"
  }
}