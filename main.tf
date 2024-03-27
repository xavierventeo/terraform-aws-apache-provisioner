# AWS provider configuration
provider "aws" {
  region = var.region
}

# EC2 instances creation

# SG for instances with public access for SSH & HTTP ports
# Needed this block to be able the SSH connection and install Apache
resource "aws_security_group" "web_app_instance_sg" {
  name        = "instance-security-group"
  description = "Security group for EC2 instance"

  # Inbound rule to allow SSH traffic from allowed IP address
  ingress {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.tcp_protocol         #protocol expects a simple string
    cidr_blocks = [var.allowed_ip_address] #cidr_blocks expects a list of strings
  }

  # Inbound rule to allow HTTP traffic from allowed IP address
  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.tcp_protocol
    cidr_blocks = [var.allowed_ip_address]
  }

  # Outbound rule to allow all outbound traffic
  egress {
    from_port = var.zero_port
    to_port   = var.zero_port
    protocol  = var.all_protocols

    cidr_blocks = [var.cidr_block_all_traffic]
  }
}

# Create a web application instance and learn how to install Apache using provisioners
# TODO Move from provisioners to github actions
resource "aws_instance" "web_app_instance" {
  ami                    = var.ami_ubuntu
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_app_instance_sg.id]
  key_name               = var.ssh_key_name # Claves SSH
  connection {
    type        = var.ssh_protocol
    user        = var.ubuntu_user
    private_key = file(var.ssh_key_full_name)
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "scripts/first-boot-web_app_instance.sh"
    destination = "first-boot-web_app_instance.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x first-boot-web_app_instance.sh",
      "./first-boot-web_app_instance.sh"
    ]
    when = create
  }
  tags = {
    Name = "WebAppInstance"
  }
}