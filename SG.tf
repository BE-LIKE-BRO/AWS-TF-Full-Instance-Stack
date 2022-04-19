resource "aws_security_group" "BLB-SG" {
  vpc_id      = aws_vpc.belikebro.id
  name        = "BLB-SG"
  description = "Security group for SSH & port 80"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  tags = {
    Name = "allow SSH & port 80"
  }
}