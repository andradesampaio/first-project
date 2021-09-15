output "hom_api"{
    value =  "${aws_instance.hom_api.public_ip}"
}

output "dev_web"{
    value =  "${aws_instance.dev_web.public_ip}"
}

output "s3_web"{
    value =  "${aws_s3_bucket.s3-srv-web.bucket_domain_name}"
}

output "dynamodb-hom"{
    value =  "${aws_dynamodb_table.dynamodb-hom.id}"
}