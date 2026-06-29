output "s3_bucket_name" {
    description = "Bucket Name"
    value = aws_s3_bucket.S3_statefile.bucket
  
}
## For checking purpose 
output "Dynamo_DB_Name" {
    description = "Dynamo_DB_Name for state lock"
    value = aws_dynamodb_table.Dynamo-table.name
}