provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}

# module "network" {
#   source              = "./network.tf"
# }

# module "storage" {
#   source              - "./storage.tf"
# }
