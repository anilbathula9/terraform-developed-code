terraform {
  backend "s3" {
    bucket = "s3-bucket-anil9"
    key    = "terraform/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
    region = "us-east-1"
  }
}
