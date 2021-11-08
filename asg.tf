
resource "aws_autoscaling_group" "asg" {
    name = "${aws_launch_configuration.lconfig.name}-asg form terraform"
    launch_configuration = aws_launch_configuration.lconfig.name
    vpc_zone_identifier = [aws_subnet.public.0.id,aws_subnet.public.1.id]
    min_size = var.min_size
    max_size = var.max_size
    desired_capacity = var.desired_capacity
    health_check_type = "ELB"
    
}

resource "aws_autoscaling_attachment" "asg_attach" {
    autoscaling_group_name = aws_autoscaling_group.asg.id
    alb_target_group_arn = aws_alb_target_group.tg.id
  
}