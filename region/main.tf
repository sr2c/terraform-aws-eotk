
data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet" "default" {
  availability_zone = data.aws_availability_zones.available.names[0]
  default_for_az = true
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

module "instance" {
  source                      = "cloudposse/ec2-instance/aws"
  version                     = "0.42.0"

  subnet                      = data.aws_subnet.default.id
  vpc_id                      = data.aws_vpc.default.id
  ami                         = data.aws_ami.ubuntu.id
  ami_owner                   = "099720109477"
  assign_eip_address          = true
  associate_public_ip_address = true
  disable_api_termination     = var.disable_api_termination
  instance_type               = "t3.medium"
  instance_profile            = var.iam_instance_profile_name
  user_data_base64            = var.user_data

  context                     = module.this.context
  tags                        = { Application = "EOTK" }
}

resource "aws_cloudwatch_metric_alarm" "high_bandwidth" {
  alarm_name = "eotk-bw-out-high-${module.this.id}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name = "NetworkOut"
  namespace = "AWS/EC2"
  period = "3600"
  statistic = "Sum"
  threshold = var.max_transfer_per_hour
  alarm_description = "Alerts when bandwidth out exceeds specified threshold in an hour"
  actions_enabled = "true"
  dimensions = {
    InstanceId = module.instance.id
  }

  tags = module.this.tags
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name = "eotk-cpu-high-${module.this.id}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "3600"
  statistic = "Average"
  threshold = 50
  alarm_description = "Alerts when bandwidth out exceeds specified threshold in an hour"
  actions_enabled = "true"
  dimensions = {
    InstanceId = module.instance.id
  }

  tags = module.this.tags
}
