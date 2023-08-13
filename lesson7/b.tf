provider "aws" {
      region = "us-east-1"
  
}

resource "aws_instance" "my_instance" {
    ami  =  "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_instance.id]

  


tags = {
    Name ="Web Server"
    Owner = "Victor Vardanyan"
}
}

resource "aws_security_group"  "my_instance" {
    name     =  "My WebServer Security group"
    description = "My first group"
    

    dynamic "ingress"{
        for_each = ["80","443","8080","1541","9092","9093"]
        content{
            from_port = ingress.value
            to_port  = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
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


