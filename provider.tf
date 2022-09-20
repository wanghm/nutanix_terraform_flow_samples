terraform {
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "1.7.1"
    }
  }
}

provider "nutanix" {
  username     = var.username
  password     = var.password
  endpoint     = var.endpoint
  insecure     = true
  port         = 9440
  wait_timeout = 60
  //  foundation_endpoint = var.foundation_endpoint
  //  foundation_port     = var.foundation_port
}
