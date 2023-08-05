terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~>5.10.0"
      }
    }
}

provider "aws" {
    profile = "default"
    region = "us-east-1"
  
}

resource "aws_instance" "victor" {
  count = 3
  ami = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    name = "my_instance"
    Owner = "Victor"
    Project = "Terraform Lesson"
  }
}

#count = 0  destroy current server , if  count = 3  change count = 2 delete one server out three 
#destroy command   "terraform destroy"



