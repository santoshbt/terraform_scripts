provider "aws" {
    region = "us-east-1"
    version = "~> 2.46"
}

// S3 Bucket

resource "aws_s3_bucket" "enterprise_backend_State" {
  bucket = "dev-applications-backend-state-in28minutes-def"

  lifecycle {
    prevent_destroy = false
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
    }
  }
}



// Locking - Dynamo DB

resource "aws_dynamodb_table" "enterprise_backend_lock" {
  name = "dev_application_locks"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name ="LockID"
    type = "S"
  }
}