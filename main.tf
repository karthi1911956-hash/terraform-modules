provider "aws" {
    region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = "10.0.0.0/16"
  subnet_cidr     = "10.0.1.0/24"
  vpc_name        = "my-vpc"
  subnet_name     = "my-subnet"
  availability_zone = "ap-south-1a"
}

module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
   instance_name = "var.instance_name"
}  


module "s3" {
  source = "./modules/s3"

  bucket_name = var.bucket_name

}