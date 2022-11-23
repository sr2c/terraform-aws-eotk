resource "aws_sns_topic" "this" {
  name = "${module.this.id}-alarms"
}

module "log_bucket" {
  source             = "cloudposse/s3-bucket/aws"
  version            = "0.49.0"
  acl                = "private"
  enabled            = true
  versioning_enabled = false
  context            = module.this
  attributes         = ["logs"]
}

data "aws_iam_policy_document" "eotk" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "logs" {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:DeleteObject"
    ]
    resources = ["${module.log_bucket.bucket_arn}/*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [module.log_bucket.bucket_arn]
  }
}

resource "aws_iam_policy" "logs" {
  name   = "${module.this.id}-logs-policy"
  policy = data.aws_iam_policy_document.logs.json
}

module "instance_profile_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  attributes = ["profile"]

  context = module.this.context
}

resource "aws_iam_role" "eotk" {
  name               = "${module.this.id}-role"
  assume_role_policy = data.aws_iam_policy_document.eotk.json
  tags               = module.instance_profile_label.tags
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.eotk.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "logs" {
  role       = aws_iam_role.eotk.name
  policy_arn = aws_iam_policy.logs.arn
}

resource "aws_iam_instance_profile" "eotk" {
  name = "${module.this.id}-profile"
  role = aws_iam_role.eotk.name
}

data "cloudinit_config" "this" {
  base64_encode = true
  gzip          = true

  part {
    content = templatefile("${path.module}/templates/user_data.yaml", {
      logrotate_script = jsonencode(templatefile("${path.module}/templates/logrotate",
      { bucket_name = module.log_bucket.bucket_id })),
      crontab = jsonencode(file("${path.module}/templates/cron"))
    })
    content_type = "text/cloud-config"
    filename     = "user_data.yaml"
  }
}

module "instance_1" {
  source                    = "./region"
  iam_instance_profile_name = aws_iam_instance_profile.eotk.name
  context                   = module.this.context
  attributes                = ["first"]
  user_data                 = data.cloudinit_config.this.rendered
  disable_api_termination   = var.disable_api_termination
  max_transfer_per_hour     = var.max_transfer_per_hour
}

module "instance_2" {
  providers = {
    aws = aws.second_region
  }
  source                    = "./region"
  iam_instance_profile_name = aws_iam_instance_profile.eotk.name
  context                   = module.this.context
  attributes                = ["second"]
  user_data                 = data.cloudinit_config.this.rendered
  disable_api_termination   = var.disable_api_termination
  max_transfer_per_hour     = var.max_transfer_per_hour
}
