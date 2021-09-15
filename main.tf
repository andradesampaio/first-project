provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    alias = "hom"
    region = "us-east-2"
}


resource "aws_instance" "dev_web" {
    ami = var.ami.dev
    instance_type = var.instance_type.free
    key_name = var.key_name
    depends_on = [aws_s3_bucket.s3-srv-web]

    tags = {
      "Name" = "srv-web"
    }

    vpc_security_group_ids = ["${aws_security_group.access-ssh-dev.id}"]
}

resource "aws_instance" "hom_api" {
    ami = var.ami.hom
    provider = aws.hom
    instance_type = var.instance_type.free
    key_name = var.key_name
    depends_on = [aws_dynamodb_table.dynamodb-hom]

    tags = {
      "Name" = "srv-api"
    }

    vpc_security_group_ids = ["${aws_security_group.access-ssh-hom.id}"]
}
resource "aws_s3_bucket" "s3-srv-web" {
  bucket = "s3-srv-web"
  acl    = "private"

  tags = {
    Name = "bucket-image-srv-web"
  }
}

resource "aws_dynamodb_table" "dynamodb-hom" {
  provider = aws.hom
  name = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "UserId"
  range_key = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}
