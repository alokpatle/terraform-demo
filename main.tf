import "tfplan"

main = rule {
  all tfplan.resources.aws*instance as *, instances {
    all instances as \_, r {
      (length(r.applied.tags) else 0) > 0
    }
  }
}

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

}
