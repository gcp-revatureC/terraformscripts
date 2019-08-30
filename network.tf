resource "google_compute_network" "vpc_network" {
  name                    = "storage-network"
  auto_create_subnetworks = false
}

resource "google_compute_network" "vpc_network2" {
  name                    = "application-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1-1" {
  name          = "sub1"
  ip_cidr_range = "10.1.0.0/24"
  network       = "${google_compute_network.vpc_network.self_link}"
}

resource "google_compute_subnetwork" "subnet2-1" {
  name          = "sub2"
  ip_cidr_range = "10.1.1.0/24"
  network       = "${google_compute_network.vpc_network.self_link}"
}

resource "google_compute_subnetwork" "subnet1-2" {
  name          = "sub3"
  ip_cidr_range = "10.2.0.0/24"
  network       = "${google_compute_network.vpc_network2.self_link}"
}

resource "google_compute_subnetwork" "subnet2-2" {
  name          = "sub4"
  ip_cidr_range = "10.2.1.0/24"
  network       = "${google_compute_network.vpc_network2.self_link}"
}

resource "google_compute_subnetwork" "subnet3-2" {
  name          = "sub5"
  ip_cidr_range = "10.2.2.0/24"
  network       = "${google_compute_network.vpc_network2.self_link}"
}

resource "google_compute_vpn_gateway" "gateway1" {
  name    = "vpngate"
  region  = "${var.region}"
  network = "${google_compute_network.vpc_network.self_link}"
}

resource "google_compute_firewall" "default" {
  name    = "firewalls"
  network = "${google_compute_network.vpc_network.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443", "3389"]
  }

  source_tags = ["web"]
}

