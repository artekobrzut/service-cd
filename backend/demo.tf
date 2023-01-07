provider "aws" {
region = var.region
  secret_key = var.secret_key
  access_key = var.access_key
}

locals {
  instance_name = "backend"
}

resource "aws_instance" "backend" {
  instance_type          = "${var.instance_type}"
  ami                    = "${var.ami}"
  count                  = "1"
  user_data              = "${file("scripts/init.sh")}"
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
  tags = {
    Name = local.instance_name
  }
}


resource "aws_security_group" "ssh-allowed" {
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Ideally best to use your machines' IP. However if it is dynamic you will need to change this in the vpc every so often.
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "instance_ip_addr" {
  value       = aws_instance.backend.public_ip
  description = "The public IP address of the main server instance."
}
