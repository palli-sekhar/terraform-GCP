provider "google" {
    project = var.project_id
    credentials = file("chaithu-project-463807-228186116dda.json")
    region = var.region
    zone = var.zone
}

module "vpc" {
    source = "./modules/vpc"
    vpc_name = "module-vpc"
    subnet_name = "module-subnet"
    cidr = "13.0.0.0/24"
    region = var.region
}

module "firewall" {
    source = "./modules/firewall"
    network = module.vpc.network_id
}

module "instance" {
    source = "./modules/instance"
    instance_name = "module-instance"
    machine_type = "e2-medium"
    zone = var.zone
    network = module.vpc.network_id
    subnet = module.vpc.subnet_id
}