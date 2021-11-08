//Configure Environment eg. Dev,Stage OR Production
environment                = "Development"

//Configure AWS Region
region                     = "ap-south-1"

//Configure VPC, Subnets, AND Availability Zones
vpc_name                   = "MyVPC"
cidr_block                 = "10.0.0.0/16"
public_subnet_cidr_blocks  = ["10.0.0.0/24", "10.0.2.0/24"]
private_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.3.0/24"]
availability_zones         = ["ap-south-1a", "ap-south-1b"]

//Configure Autoscaling Group and Launch Template
image_id                   = "ami-0c1a7f89451184c8b"
instance_type              = "t2.micro"
key_name                   = "deployer-key"
min_size                   = "2"
max_size                   = "3"
desired_capacity           = "2"

//Configure AWS Access Key and SecretKey of AWS IAM User
access_key = ""
secret_key = ""
