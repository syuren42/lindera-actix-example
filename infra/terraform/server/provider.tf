provider "aws" {
  region = "ap-northeast-1"
  version = "3.32.0"
}

terraform {
  required_version = "1.0.1"
  backend "s3" {}
}
