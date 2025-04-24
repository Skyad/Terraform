
#EC2 instance for Nginx setup
resource "aws_instance" "nginxserver" {
  ami = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true


  #To setup and run NGINX
  user_data = <<-EOF
                #!/bin/bash
                sudo yum install nginx -y
                sudo systemctl start nginx
                EOF

  tags = {
    Name = "nginxserver"
 }
}