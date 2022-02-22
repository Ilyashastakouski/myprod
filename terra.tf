provider "aws" {
   access_key = "AK"
   secret_key = "SK"
   region = "us-east-2"


}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc1"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a","us-east-2b"]
  private_subnets = ["10.0.1.0/28"]
  public_subnets  = ["10.0.101.0/28"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
