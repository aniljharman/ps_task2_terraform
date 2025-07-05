resource "aws_autoscaling_group" "web_asg" {
  name_prefix          = "poc-web-asg-"
  min_size             = 2
  max_size             = 2
  desired_capacity     = 2
  vpc_zone_identifier  = values(aws_subnet.public)[*].id

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.web_tg.arn]

  tag {
    key                 = "Name"
    value               = "poc-web"
    propagate_at_launch = true
  }
}
