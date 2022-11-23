variable "disable_api_termination" {
  type        = bool
  default     = false
  description = "Enable EC2 Instance Termination Protection"
}

variable "max_transfer_per_hour" {
  type        = string
  default     = "2147483648"
  description = "The maximum number of bytes that can be sent out per hour."
}
