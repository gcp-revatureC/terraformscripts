resource "google_storage_bucket" "car-store" {
  name          = "car-data-234254"
  location      = "US"
  storage_class = "MULTI_REGIONAL"
  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
    condition {
      age = "2"
    }
  }
}

resource "google_storage_bucket" "archive-store" {
  name          = "archive-234254"
  location      = "us-central1"
  storage_class = "COLDLINE"
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = "365"
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
}

# resource "google_sql_database_instance" "master" {
#   name             = "master-instancess"
#   database_version = "POSTGRES_9_6"
#   region           = "${var.region}"

#   settings {
#     # Second-generation instance tiers are based on the machine
#     # type. See argument reference below.
#     tier = "db-f1-micro"
#   }
# }


