terraform {
  required_version = ">= 1.6.0"

  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 2.51"
    }
  }

  # Remote state in Scaleway Object Storage (S3-compatible).
  # Create the bucket first, then uncomment and `terraform init -migrate-state`.
  #
  # backend "s3" {
  #   bucket                      = "ozonet-tfstate"
  #   key                         = "terraform.tfstate"
  #   region                      = "fr-par"
  #   endpoints                   = { s3 = "https://s3.fr-par.scw.cloud" }
  #   skip_credentials_validation = true
  #   skip_region_validation      = true
  #   skip_requesting_account_id  = true
  #   skip_s3_checksum            = true
  #   skip_metadata_api_check     = true
  # }
}
