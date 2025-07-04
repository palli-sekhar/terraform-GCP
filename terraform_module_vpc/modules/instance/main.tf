resource "google_compute_instance" "instance" {
    name = var.instance_name
    machine_type = var.machine_type
    zone = var.zone

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"
      }
    }

    network_interface {
      network = var.network
      subnetwork = var.subnet

      access_config {
        
      }
    }
#     lifecycle {
#   prevent_destroy = true
# }  
    tags = ["web"]

    metadata_startup_script = <<-EOF
        #!/bin/bash
        apt-get update
        apt-get install -y nginx
        systemctl enable nginx
        systemctl start nginx
        echo '<h1>welcome to nginx on gcp!</h1>' > /var/www/html/index.html
    EOF 

}