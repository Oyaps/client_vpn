yesprovider "aws" {
  profile = "mars"
  region  = "ap-southeast-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }
  backend "s3" {
    bucket  = "mars-tfstates-dev"
    key     = "dev/terraform.tfstate"
    region  = "ap-southeast-2"
    profile = "mars"
  }

}
