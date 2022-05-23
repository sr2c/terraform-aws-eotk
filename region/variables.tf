variable "disable_api_termination" {
  type = bool
  description = "Enable EC2 Instance Termination Protection"
}

variable "iam_instance_profile_name" {
  type = string
  description = "Instance profile name for the EC2 instance."
}

variable "max_transfer_per_hour" {
  type = string
  default = "2147483648"
  description = "The maximum number of bytes that can be sent out per hour."
}

variable "user_data" {
  type = string
  description = "Base64-encoded user-data for the EC2 instance."
}