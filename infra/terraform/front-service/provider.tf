provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_version = "1.0.1"
  backend "s3" {}
}