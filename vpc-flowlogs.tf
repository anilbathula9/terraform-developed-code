resource "aws_flow_log" "flowlogs" {
  log_destination      = aws_s3_bucket.bucket.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.main_vpc.id
}