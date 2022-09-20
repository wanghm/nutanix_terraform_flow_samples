resource "nutanix_address_group" "test_address" {
  name        = "test123456"
  description = "test address groups resource"

  ip_address_block_list {
    ip            = "10.10.10.0"
    prefix_length = 24
  }
}