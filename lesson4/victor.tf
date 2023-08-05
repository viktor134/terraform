provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "my_webserver" {
    ami         =   "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver.id]
    user_data              = <<-EOT
                         #!/bin/bash
                         sudo apt update
                         sudo apt install -y nginx
                         sudo systemctl start nginx
                         EOT
                   

    


tags = {
    Name ="Web Server Build by Terraform"
    Owner = "Victor Vardanyan"
}

}

resource "aws_security_group"  "my_webserver" {
    name     =  "My WebServer Security group"
    description = "My first group"
    
    

    ingress {
        from_port  =  80
        to_port    =  80
        protocol   =  "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

      ingress {
        from_port  =  443
        to_port    =  443
        protocol   =  "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

   egress {
     from_port  = 0
     to_port    = 0
     protocol   = "-1"
     cidr_blocks = ["0.0.0.0/0"]
   }
   
   tags ={
    Name = "Web Server Security group"
    Owener = "Viktor Vardanyan"
   }
}


