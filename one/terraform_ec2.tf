provider "aws" {
  access_key = "AKIAXMH3OALEA4RJXPL3"
  secret_key = "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"
  region     = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0ce933e2ae91880d3"
  instance_type = "t2.micro"
}