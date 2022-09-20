#Variables Definition
variable "cluster_name" {}
variable "endpoint" {}
variable "username" {}
variable "password" {}

data "nutanix_cluster" "myCluster" {
  name = var.cluster_name
}

resource "nutanix_category_key" "apptype" {
  name = "AppType"
}

resource "nutanix_category_value" "apptype1" {
  name  = nutanix_category_key.apptype.id
  value = "myapp1"
}

resource "nutanix_category_value" "apptype2" {
  name  = nutanix_category_key.apptype.id
  value = "myapp2"
}


resource "nutanix_category_key" "apptier" {
  name = "AppTier"
}

resource "nutanix_category_value" "apptier1" {
  name  = nutanix_category_key.apptier.id
  value = "web"
}

resource "nutanix_category_key" "appowner" {
  name = "APP Owner"
}

resource "nutanix_category_value" "appowner1" {
  name  = nutanix_category_key.appowner.id
  value = "Wang"
}

resource "nutanix_category_value" "appowner2" {
  name  = nutanix_category_key.appowner.id
  value = "John"
}

resource "nutanix_category_key" "vdiservers" {
  name = "VID servers"
}

resource "nutanix_category_value" "vdiserver1" {
  name        = nutanix_category_key.vdiservers.id
  description = "Test Category Value1"
  value       = "dev1"
}

resource "nutanix_category_value" "vdiserver2" {
  name        = nutanix_category_key.vdiservers.id
  description = "Test Category Value2"
  value       = "dev2"
}

resource "nutanix_category_value" "vdiserver3" {
  name        = nutanix_category_key.vdiservers.id
  description = "Test Category Value3"
  value       = "dev3"
}

resource "nutanix_category_value" "vdiserver4" {
  name        = nutanix_category_key.vdiservers.id
  description = "Test Category Value4"
  value       = "dev4"
}

resource "nutanix_network_security_rule" "isolation" {
  name        = "example-isolation-rule"
  description = "Isolation Rule Example"

  isolation_rule_action = "APPLY"

  isolation_rule_first_entity_filter_kind_list = ["vm"]
  isolation_rule_first_entity_filter_type      = "CATEGORIES_MATCH_ALL"
  isolation_rule_first_entity_filter_params {
    name   = "Environment"
    values = ["Dev"]
  }

  isolation_rule_second_entity_filter_kind_list = ["vm"]
  isolation_rule_second_entity_filter_type      = "CATEGORIES_MATCH_ALL"
  isolation_rule_second_entity_filter_params {
    name   = "Environment"
    values = ["Production"]
  }
}

data "nutanix_network_security_rule" "testisolation1" {
  network_security_rule_id = nutanix_network_security_rule.isolation.id
}