provider "google" {
  # credentials = file("./key_editor.json")
  project = "avinashvidyarthi"
  region = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "do-whatever-you-want-here"
    prefix = "terraform/"
  }
}

resource "google_compute_instance" "example" {
  name = "my-vm"
  machine_type = "n1-standard-1"
  zone = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  network_interface {
    network = "default"
  }
  scheduling {
    automatic_restart = false
    on_host_maintenance = "TERMINATE"
  }
}
