resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Disabled due to AWS Academy SCP explicit deny on s3:GetBucketObjectLockConfiguration
