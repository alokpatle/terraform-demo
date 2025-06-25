terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "test_server" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"
 tags = {
    Name = "Test server 4"
  }
}
