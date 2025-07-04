terraform {
  backend "gcs" {
    bucket  = "terbuc"
    prefix  = "terraform_module/statef"
  }
}