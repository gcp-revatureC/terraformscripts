    
provider "google" {
  credentials = "${file("account.json")}"
  project     = "kent-terraform-admin"
  region      = "us-central1"
}

resource "google_compute_network" "vpc_network" {
    name = "vpc-network" 
    region = "us-central1"
    gateway_ipv4 = "10.2.0.0/16"

auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "subnet1" {
    name = "sub1"
    ip_cidr_range = "10.2.0.0/24"
    region = "us-cental1"
    network = "google_compute_network.vpc_network.self_test" 
    secondary_ip_range {
        range_name = "subnet2"
        ipc_cidr_range = "10.2.0.0/32" 
    }
}
resource "google_compute_vpn_gateway" "gateway1" { 
    name = "vpn_gate"
    region = "us-central1"
    network = "google_compute_network.vpc_netowrk.self_test"
}
