terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "jacobVPC" {
  cidr_block = "192.168.0.0/16"
  tags = {
    "Name" = "Jacob-dev-vpc"
  }
}
resource "aws_subnet" "Subnet_Jacob" {
  vpc_id     = aws_vpc.jacobVPC.id
  cidr_block = "192.168.0.0/20"
  tags = {
    "Name" = "Jacob-k8s-subnet"
  }
}

resource "aws_network_interface" "jacobsNetwork" {
  subnet_id   = aws_subnet.Subnet_Jacob.id
  private_ips = ["192.168.0.7"]

  tags = {
    Name = "Jacobs_network_interface"
  }
}
