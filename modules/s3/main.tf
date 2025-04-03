resource "aws_s3_bucket" "terraform_state" {
  bucket = "medicate-terraform-state-dev"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "dev"
  }
}

# 🔹 Set Bucket Ownership to 'BucketOwnerEnforced' (Removes need for ACLs)
resource "aws_s3_bucket_ownership_controls" "terraform_state_ownership" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"  # Change to "Enabled" if versioning is needed
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PROVISIONED" # Free tier supports provisioned mode
  read_capacity  = 1
  write_capacity = 1
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "dev"
  }
}
