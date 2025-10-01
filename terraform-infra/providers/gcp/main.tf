provider "google" {
  project = var.project
  region  = var.region
}

resource "google_storage_bucket" "sample" {
  name     = var.bucket_name
  location = var.region
}
