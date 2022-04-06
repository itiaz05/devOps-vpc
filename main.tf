terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-1"
}

# Create a VPC
resource "aws_vpc" "itai-vpc" {
  cidr_block = "198.52.13.0/24"
  tags = {
    Name = "itai-vpc"
  }
}

resource "aws_subnet" "subnet_web" {
  vpc_id     = aws_vpc.itai-vpc.id
  cidr_block = "198.52.13.0/27"
  tags = {
    Name = "subnet_web"
  }
}

resource "aws_subnet" "subnet_app" {
  vpc_id     = aws_vpc.itai-vpc.id
  cidr_block = "198.52.13.32/27"
  tags = {
    Name = "subnet_app"
  }
}

resource "aws_subnet" "subnet_db" {
  vpc_id     = aws_vpc.itai-vpc.id
  cidr_block = "198.52.13.64/28"
  tags = {
    Name = "subnet_db"
  }
}