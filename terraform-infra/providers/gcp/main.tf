provider "google" {
  project = var.project
  region  = var.region
}

resource "google_storage_bucket" "sample" {
  name     = var.bucket_name
  location = var.region
}

# Uncomment resources below as needed:

# resource "google_compute_network" "main" {
#   name                    = "main-network"
#   auto_create_subnetworks = true
# }

# resource "google_compute_instance" "main" {
#   name         = "main-instance"
#   machine_type = "e2-micro"
#   zone         = "${var.region}-a"
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }
#   network_interface {
#     network = google_compute_network.main.name
#     access_config {}
#   }
# }

# resource "google_sql_database_instance" "main" {
#   name             = "main-sql"
#   database_version = "MYSQL_8_0"
#   region           = var.region
#   settings {
#     tier = "db-f1-micro"
#   }
# }

# resource "google_pubsub_topic" "main" {
#   name = "main-topic"
# }

# resource "google_cloudfunctions_function" "main" {
#   name        = "main-function"
#   runtime     = "nodejs16"
#   entry_point = "helloWorld"
#   source_archive_bucket = google_storage_bucket.sample.name
#   source_archive_object = "function-source.zip"
#   trigger_http = true
# }
