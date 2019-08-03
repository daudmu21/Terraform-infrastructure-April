terraform {
  backend "s3" {
    bucket = "infrastructure-april-da"
    key    = "infra.state"
    region = "us-west-1"
  }
}