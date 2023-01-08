terraform {
  # Deploy version v0.0.3 in stage
  source = "git::https://github.com/artekobrzut/service-cd.git//"
}

inputs = {
  instance_count = 1
  region = "us-west-1"
  instance_type = "t2.micro"
  ami = "ami-0f5e8a042c8bfcd5e"

}