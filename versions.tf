terraform {
  required_providers {
    aws = {
      version               = ">= 4.4.0"
      configuration_aliases = [aws, aws.second_region]
    }
  }
}