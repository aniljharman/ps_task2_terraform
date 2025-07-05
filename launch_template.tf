data "aws_ami" "al2" { ... }

resource "aws_launch_template" "web_lt" {
  ...
}

resource "aws_autoscaling_group" "web_asg" {
  ...
}
