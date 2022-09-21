
#Variables Definition
variable "cluster_name" {}
variable "endpoint" {}
variable "username" {}
variable "password" {}

# Isolation Policy
resource "nutanix_network_security_rule" "isolation" {
  name        = "Dev-Prod-isolation-rule"
  description = "Isolation Rule for Dev and Prod Environment"

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

# APP policies
resource "nutanix_network_security_rule" "myapp1" {
  name        = "myapp-1"
  description = "rule 1 tiers"

  app_rule_action = "APPLY"

  app_rule_inbound_allow_list {
    peer_specification_type = "FILTER"
    filter_type             = "CATEGORIES_MATCH_ALL"
    filter_kind_list        = ["vm"]

    filter_params {
      name   = nutanix_category_key.apptype.id
      values = [nutanix_category_value.apptype1.value]
    }
    filter_params {
      name   = nutanix_address_group.maint_address.id
      values = [nutanix_address_group.maint_address.id]
    }
  }


  app_rule_target_group_default_internal_policy = "DENY_ALL"
  app_rule_target_group_peer_specification_type = "FILTER"

  app_rule_target_group_filter_type = "CATEGORIES_MATCH_ALL"

  app_rule_target_group_filter_params {
    name   = "AppType"
    values = ["Default"]
  }

  app_rule_outbound_allow_list {
    peer_specification_type = "FILTER"
    filter_type             = "CATEGORIES_MATCH_ALL"
    filter_kind_list        = ["vm"]

    filter_params {
      name   = nutanix_category_key.apptype.id
      values = [nutanix_category_value.apptype2.value]
    }
  }

}