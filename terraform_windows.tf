provider "aws" {
  access_key = "AKIAXMH3OALEA4RJXPL3"
  secret_key = "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"
  region     = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0ce933e2ae91880d3"
  instance_type = "t2.micro"
  key_name = "terraform"
  security_groups = ["${aws_security_group.allow_rdp.name}"]
}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow rdp traffic"


  ingress {

    from_port   = 3389 #  By default, the windows server listens on TCP port 3389 for RDP
    to_port     = 3389
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}