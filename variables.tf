variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "ami_ubuntu" {
  type    = string
  default = "ami-0c1c30571d2dae5c9"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ssh_protocol" {
  type    = string
  default = "ssh"
}

variable "tcp_protocol" {
  type    = string
  default = "tcp"
}

variable "all_protocols" {
  type    = string
  default = "-1"
}

variable "ssh_key_name" {
  type = string
}

variable "ssh_key_full_name" {
  type = string
}

variable "ubuntu_user" {
  type    = string
  default = "ubuntu"
}

variable "http_port" {
  description = "HTTP port"
  type        = number
  default     = 80
}

variable "ssh_port" {
  description = "SSH port"
  type        = number
  default     = 22
}

variable "zero_port" {
  description = "Port for allowed outbound traffic (default: 0)"
  default     = 0
}

variable "cidr_block_all_traffic" {
  type    = string
  default = "0.0.0.0/0"
}

variable "allowed_ip_address" {
  description = "Allowed IP address for SSH access"
  type        = string
  default     = "0.0.0.0/0" # All traffic by default
}