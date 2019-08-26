provider "google" {
  credentials = "${file("account.json")}"
  project     = "my-project-id"
  region      = "us-central1"
}

resource "google_storage_bucket" "car-store" {
  name     = "car-data"
  location = "US"
  storage_class = "MULTI_REGIONAL"
  lifecycle_rule {
      action {
        type = SetStorageClass
        storage_class = COLDLINE
      }
      condition {
        age = 2
      }
  }
}

resource "google_storage_bucket" "archive-store" {
  name     = "archive"
  location = "us-central1"
  storage_class = "COLDLINE"
  lifecycle_rule{
    action{
    type = delete
    condition {
      age = 365
  }
}
}
}

resource "google_bigquery_dataset" "default" {
  dataset_id                  = "foo"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role   = "ADMIN"
    domain = "example.com"
  }
 
}

resource "google_sql_database_instance" "master" {
  name = "master-instance"
  database_version = "POSTGRES_9_6"
  region = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro"
  }
}


