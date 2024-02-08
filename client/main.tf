provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "cyfyoutube" {
  bucket = "cyfyoutube"

  website {
    index_document = "index.html"
  }

  force_destroy = true  

  versioning {
    enabled = false  
  }

  lifecycle_rule {
    enabled = false  
  }
}

resource "aws_s3_bucket_policy" "cyfyoutube_bucket_policy" {
  bucket = aws_s3_bucket.cyfyoutube.bucket

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Statement1",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::cyfyoutube/*"
    }
  ]
}
EOF
}

resource "aws_s3_bucket_versioning" "cyfyoutube2_versioning" {
  bucket = aws_s3_bucket.cyfyoutube.bucket

  versioning_configuration {
    status = "Suspended"  
  }
}

resource "aws_s3_bucket_public_access_block" "cyfyoutube_public_access_block" {
  bucket = aws_s3_bucket.cyfyoutube.id

  block_public_acls = false
  ignore_public_acls = false
  block_public_policy = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "cyfyoutube_website" {
  bucket = aws_s3_bucket.cyfyoutube.bucket

  index_document {
    suffix = "index.html"
  }

  routing_rule {
    redirect {
      host_name          = "cyfyoutube.s3-website-us-east-1.amazonaws.com"
      protocol           = "http"
      replace_key_prefix_with = ""
    }
  }
}