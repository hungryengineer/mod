output "bucket_id" {
    value = aws_s3_bucket.main[*].id
}

output "bucket_arn" {
    value = aws_s3_bucket.main[*].arn
}

output "bucket_domain_name" {
    value = aws_s3_bucket.main[*].bucket_domain_name
}

output "bucket_hosted_zone_id" {
    value = aws_s3_bucket.main[*].hosted_zone_id
}

output "bucket_region" {
    value = aws_s3_bucket.main[*].region
}