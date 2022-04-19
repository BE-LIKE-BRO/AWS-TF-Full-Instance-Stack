variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "ZONE2" {
  default = "us-east-2b"
}

variable "ZONE3" {
  default = "us-east-2c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-08b6f2a5c291246a0"
    us-east-1 = "ami-03ededff12e34e59e"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "MYIP" {
  default = "105.112.0.0/16"
}