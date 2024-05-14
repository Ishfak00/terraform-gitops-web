variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-04e5276ebb8451442"
    us-east-2 = "ami-09b90e09742640522"
  }

}

variable "USER" {
  default = "ec2-user"
}

##