//data "nutanix_clusters" "clusters" {}
/*
data "nutanix_cluster" "myCluster" {
  name = var.cluster_name
}
*/
/*
data "nutanix_category_key" "application" {
    name = "AppType"
    description = "Application type"
}

data "nutanix_category_value" "application" {
  name        = "nutanix_category_key.application.id}"
  description = ""
  value       = "WEB-1"
}
*/

#data "nutanix_subnet" "mySubnet" {
#  subnet_name = var.subnet_name
#}

#data "nutanix_image" "myImage" {
#  image_name = var.image_name
#}

#data "template_file" "cloud-init" {
#  //base64_encode = true
#  template = file("./template/cloud-init.tpl")
#}

