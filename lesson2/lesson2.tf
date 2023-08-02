terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.10.0"  
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "victor" {
  ami = "ami-053b0d53c279acc90"
  instance_type = "t3.micro"

  tags = {
    Name = "my_instance"
    Owner = "Victor Vardanyan"
    Projet = "Terraform Lessons"
  }
}

