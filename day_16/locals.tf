# Local values for VPC Peering Demo
locals {
  users= csvdecode(file("users.csv"))
}