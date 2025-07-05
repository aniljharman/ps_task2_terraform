resource "aws_iam_role" "web_instance_role" {
  name = "poc-web-instance-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.web_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "web" {
  name = "poc-web-instance-profile"
  role = aws_iam_role.web_instance_role.name
}

resource "aws_iam_user" "webops" { name = "webops" }

resource "aws_iam_user_policy" "webops_policy" {
  name   = "webops-reboot"
  user   = aws_iam_user.webops.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow"
      Action   = ["ec2:RebootInstances"]
      Resource = "*"
    }]
  })
}
