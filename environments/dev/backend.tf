$bucketName = "cloud5-terraform-state-625ed4fe"
$backendTf = "C:\Users\epi.ds\terraform-cloud-project\environments\dev\backend.tf"

@"
terraform {
  backend "s3" {
    bucket  = "$bucketName"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
"@ | Set-Content -Path $backendTf -NoNewline