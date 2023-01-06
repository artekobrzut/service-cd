terraform {
  cloud {
    organization = "aobrzut"

    workspaces {
      name = "service-cd"
    }
  }
}