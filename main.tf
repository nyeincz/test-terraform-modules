provider "aws" {
  region = var.main_region
}

module "vpc" {
  source  = "nyeincz/vpc/aws"
  version = "1.0.0"
}

resource "aws_instance" "my-instance" {
  ami           = "ami-0d058fe428540cd89"
  subnet_id     = module.vpc.subnet_id
  instance_type = "t2.micro"
  key_name      = "key-xps15"
  tags = {
    Name = "dev-vm"
  }
}