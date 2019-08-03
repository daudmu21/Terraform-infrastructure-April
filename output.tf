output "VPC" {
  value = "${aws_vpc.dev.id}"
}
output "public_subnet" {
  value = "${aws_subnet.public.id}"
}
