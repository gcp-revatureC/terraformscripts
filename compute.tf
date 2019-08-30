resource "google_compute_instance_group" "group1" {
  name = "group1"
  zone = "us-central1-a"
  instances = [
    "${google_compute_instance.abc-instance-1.self_link}"
  ]
}

resource "google_compute_instance_group" "group2" {
  name = "group2"
  zone = "us-central1-a"
  instances = [
    "${google_compute_instance.abc-instance-2.self_link}"
  ]
}

resource "google_compute_instance_group" "group3" {
  name = "group3"
  zone = "us-central1-a"
  instances = [
    "${google_compute_instance.abc-instance-3.self_link}"
  ]
}
resource "google_compute_instance" "abc-instance-1" {
  zone         = "us-central1-a"
  name         = "abc-instance-1"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2016"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.subnet1-2.self_link}"
    access_config {
    }
  }
}

resource "google_compute_instance" "abc-instance-2" {
  zone         = "us-central1-a"
  name         = "abc-instance-2"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2016"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.subnet2-2.self_link}"
    access_config {
    }
  }
}

resource "google_compute_instance" "abc-instance-3" {
  zone         = "us-central1-a"
  name         = "abc-instance-3"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2016"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.subnet3-2.self_link}"
    access_config {
    }
  }
}

