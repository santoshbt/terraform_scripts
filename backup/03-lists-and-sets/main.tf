variable "names" {
  default = ["ravs","john", "tom"]
}

provider "aws" {
  region  = "us-east-1"
  version = "~> 2.46"
}


resource "aws_iam_user" "my_iam_users" {
  # count = length(var.names)
  # name  = var.names[count.index]
  for_each = toset(var.names)
  name = each.value
}