resource "aws_alb" "myelb" {
    subnets = [aws_subnet.public.0.id,aws_subnet.public.1.id]
    security_groups = [aws_security_group.main.id]
 }

resource "aws_alb_target_group" "tg" {
  name = "alb-target-grouop"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.default.id
}

resource "aws_alb_listener" "listner" {
  load_balancer_arn = aws_alb.myelb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.tg.arn
    type = "forward"
  }
  
}
  


