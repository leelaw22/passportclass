terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "passport2-420700"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = "passport2-420700-5310a94eaa31.json"
}

resource "google_storage_bucket" "sayplease" {
  name          = "sayplease001"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}