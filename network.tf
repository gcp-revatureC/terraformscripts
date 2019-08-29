    
provider "google" {
  credentials = "${file("account.json")}"
  project     = "kent-terraform-admin"
  region      = "us-central1"
}

resource "google_compute_network" "default" {
    name = "vpc-network" 
    region = "us-central1"
    gateway_ipv4 = "10.2.0.0/16"

auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "subnet1" {
    name = "sub1"
    ip_cidr_range = "10.2.0.0/24"
    region = "us-cental1"
    network = "${google_compute_network.default.name}"
    secondary_ip_range {
        range_name = "subnet2"
        ipc_cidr_range = "10.2.0.0/32" 
    }
}
resource "google_compute_vpn_gateway" "gateway1" { 
    name = "vpn_gate"
    region = "us-central1"
    network = "${google_compute_network.default.name}"
}

resource "google_compute_firewall" "default" {
  name    = "firewalls"
  network = "${google_compute_network.default.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

