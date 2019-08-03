output "VPC" {
  value = "${aws_vpc.dev.id}"
}
output "public_subnet" {
  value = "${aws_subnet.public.id}"
}

output "private_subnet" {
  value = "${aws_subnet.private.id}"
}

output "pub_sec_group" {
  value = "${aws_security_group.Public.id}"
}

output "pub_sec_group" {
  value = "${aws_security_group.PrivateDB.id}"
}

output "key_name" {
  value = "${var.key_name}"
}
