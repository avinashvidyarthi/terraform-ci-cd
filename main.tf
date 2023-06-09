provider "google" {
  # credentials = file("./key_editor.json")
  project = "avinashvidyarthi" #change your project here 
  region = "us-central1" #change your region here
}

terraform {
  backend "gcs" {
    bucket = "do-whatever-you-want-here" #change your GCS bucket here
    prefix = "terraform/" #change your prefix here
  }
}

# you can change the configuration accordingly
resource "google_compute_instance" "example" {
  name = "my-vm"
  machine_type = "f1-micro"
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
