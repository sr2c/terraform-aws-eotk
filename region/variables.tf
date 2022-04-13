variable "iam_instance_profile_name" {
  type = string
  description = "Instance profile name for the EC2 instance."
}

variable "user_data" {
  type = string
  description = "Base64-encoded user-data for the EC2 instance."
}