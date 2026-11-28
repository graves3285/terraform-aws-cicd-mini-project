# Terraform AWS CI/CD Mini-Project

Modular Terraform infrastructure for AWS (us-east-1) with remote S3 state and dev, test, and prod environments.

## Structure
- bootstrap/: S3 remote state bucket (cloud5-terraform-state-625ed4fe)
- modules/: network, security, compute, load_balancer, database, storage
- environments/: dev, test, prod
- .github/workflows/: GitHub Actions CI checks

## Notes
- AWS Academy labs may block s3:GetBucketObjectLockConfiguration via SCP.
- Always run terraform destroy after testing to save credits.
