
resource "google_compute_network" "vpc_network" {
  name         = "vpc-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "sub1"
  ip_cidr_range = "10.2.0.0/24"
  network       = "${google_compute_network.vpc_network.self_link}"
}

resource "google_compute_vpn_gateway" "gateway1" {
  name    = "vpngate"
  region  = "${var.region}"
  network = "${google_compute_network.vpc_network.self_link}"
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

