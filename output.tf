output "elb_dns_name" {
  value       = aws_alb.myelb.dns_name
  description = "The domain name of the load balancer"
}