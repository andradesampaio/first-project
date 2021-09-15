variable "ami"{
 description = "Ami used by ec2"
 type = map(string)

 default = {
     dev = "ami-087c17d1fe0178315"
     hom = "ami-0ba62214afa52bec7"
 }
}

variable "region"{
 description = "Region used by deploy the application"
 type = map(string)

 default = {
     dev = "us-east-1"
     hom = "us-east-2"
 }
}

variable "cidr_access_remote"{
 description = "List ips used by acess the application"
 type = list(string)

 default = ["177.188.71.130/32", "179.228.38.66/32"]
}

variable "key_name"{
    description = "Key name used by application"
    type =  string

    default = "terraform-aws"
}

variable "instance_type"{
    description = "Instance type used by deploy"
    type = map(string)

    default = {
        free = "t2.micro"
    }
}