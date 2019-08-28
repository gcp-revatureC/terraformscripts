provider "google" {
  credentials = "${file("account.json")}"
  project     = "my-project-id"
  region      = "us-central1"
}

module "network" {
  source              = "./network.tf"
}
