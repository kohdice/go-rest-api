data "archive_file" "lambda_zip" {
  type        = "zip"
  output_path = "${path.module}/${var.lambda_archive}"
  source_file = "${path.module}/../../${var.lambda_binary}"
}

resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "lambda-bucket-${var.environment}"
}

resource "aws_s3_bucket_ownership_controls" "lambda_bucket_ownership_controls" {
  bucket = aws_s3_bucket.lambda_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "lambda_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.lambda_bucket_ownership_controls]

  bucket = aws_s3_bucket.lambda_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = "functions/${var.lambda_archive}"
  source = data.archive_file.lambda_zip.output_path
}
