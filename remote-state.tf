terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "company-bank"

    workspaces {
      name = "my-app-pet"
    }
  }
}