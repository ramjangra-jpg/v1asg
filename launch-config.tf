resource "aws_launch_configuration" "lconfig" {
  name_prefix = "LaunchConfig form Terraform"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [aws_security_group.main.id]
  associate_public_ip_address = true
  user_data = file("userdata.sh")
  
}