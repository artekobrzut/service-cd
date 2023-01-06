terraform {
  cloud {
    organization = "aobrzut"

    workspaces {
      name = "cli-service2"
    }
  }
}