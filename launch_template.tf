data "aws_ami" "al2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }
}

resource "aws_launch_template" "web" {
  name_prefix   = "poc-web-"
  image_id      = data.aws_ami.al2.id
  instance_type = var.instance_type

  user_data = base64encode(<<-EOS
              #!/bin/bash
              set -e

              yum update -y
              amazon-linux-extras enable nginx1
              amazon-linux-extras install -y nginx1
              
              sed -i 's/listen       80;/listen       8080;/' /etc/nginx/nginx.conf
              
              echo "<h1>Zantac POC - $(hostname)</h1>" > /usr/share/nginx/html/index.html

              systemctl enable nginx
              systemctl restart nginx
              EOS
  )

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "poc-web"
    }
  }
}
