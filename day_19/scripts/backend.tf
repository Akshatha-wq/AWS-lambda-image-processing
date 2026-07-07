terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-akshatha"
    key    = "terraform-day19.tfstate"
    region = "us-east-1"
  }
}