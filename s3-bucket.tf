resource "aws_s3_bucket" "bucket" {
  bucket = "s3-bucket-anil9"
  acl    = "private"
  
  versioning {
    enabled = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}