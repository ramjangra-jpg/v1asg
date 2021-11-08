resource "aws_security_group" "main" {
  name        = "allow-custom-ports"
  vpc_id      = aws_vpc.default.id
  description = "HTTP, HTTPS, SSH"
  ingress {
    description = "HTTP for webserver"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS for webserver"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["111.93.242.34/32","180.151.15.236/32","180.151.78.218/32","180.151.78.220/32","180.151.78.222/32","182.74.4.226/32","35.169.106.126/32"]
  }
  egress {
    description = "output from webserver"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-webserver-sg"
    Environment = "${var.environment}"
  }
}
/*resource "aws_security_group" "rds" {
  vpc_id      = aws_vpc.default.id
  description = "RDS Instance Access"
  ingress {
    description = "RDS Access"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "output from RDS"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}*/


/*resource "aws_network_acl" "nacl" {
  vpc_id = aws_vpc.default.id

  egress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }



  tags = {
    Name        = "${var.project}-MyNACL"
    Environment = "${var.environment}"
  }
}*/
