terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""

}

resource "aws_vpc" "my-vpc" {
  tags = {

    Name = "Production vpc"
  }
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod_subnet"
  }
}

resource "aws_instance" "foo" {
  ami = "ami-096fda3c22c1c990a"
  instance_type = "t2.micro"
}