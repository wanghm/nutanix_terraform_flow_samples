
data "nutanix_cluster" "myCluster" {
  name = var.cluster_name
}

# System Defined Category, need to import first
resource "nutanix_category_key" "apptype" {
  name = "AppType"
}

# System Defined Category, need to import first
resource "nutanix_category_key" "apptier" {
  name = "AppTier"
}

# System Defined Category, need to import first
resource "nutanix_category_key" "env" {
  name = "Environment"
}

resource "nutanix_category_value" "apptype1" {
  name  = nutanix_category_key.apptype.id
  value = "myapp1"
}

resource "nutanix_category_value" "apptype2" {
  name  = nutanix_category_key.apptype.id
  value = "myapp2"
}

resource "nutanix_category_value" "apptier1" {
  name  = nutanix_category_key.apptier.id
  value = "WEB"
}

resource "nutanix_category_value" "apptier2" {
  name  = nutanix_category_key.apptier.id
  value = "AP"
}

resource "nutanix_category_value" "apptier3" {
  name  = nutanix_category_key.apptier.id
  value = "DB"
}

resource "nutanix_category_key" "appowner" {
  name = "APP Owner"
}

resource "nutanix_category_value" "appowner1" {
  name  = nutanix_category_key.appowner.id
  value = "IT Dept."
}

resource "nutanix_category_value" "appowner2" {
  name  = nutanix_category_key.appowner.id
  value = "HR Dept."
}
