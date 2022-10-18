variable "server_public_key" {}

variable "instance_count" {
  default = 4
  type    = number
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}
