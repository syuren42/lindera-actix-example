remote_state {
  backend = "s3"
  config = {
    bucket  = "terraform-store-${get_aws_account_id()}"
    region  = "ap-northeast-1"
    key     = "ap-northeast-1/lindera-api/${path_relative_to_include()}/terraform.tfstate"
    encrypt = true
  }
}
