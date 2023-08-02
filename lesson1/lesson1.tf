terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}



resource "aws_instance" "my_instance" {
  count = 3 
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "nginx"
  }
}



