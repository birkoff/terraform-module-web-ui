module "s3_frontend_files" {
  source                  = "git::https://github.com/terraform-aws-modules/terraform-aws-s3-bucket.git//?ref=v3.6.1"
  bucket                  = "${element(var.frontend_subdomain_aliases, 0)}.${var.hosted_zone_name}"
  block_public_acls       = "true"
  block_public_policy     = "true"
  ignore_public_acls      = "true"
  restrict_public_buckets = "true"
  attach_policy           = "true"
  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
  policy = jsonencode(
    {
      Version : "2012-10-17",
      "Statement" : [
        {
          Effect : "Allow",
          Principal : {
            "AWS" : ["*"]
          },
          Action : [
            "s3:GetObject",
            "s3:PutObject"
          ],
          Resource : [
            module.s3_frontend_files.s3_bucket_arn,
            format("%s/*", module.s3_frontend_files.s3_bucket_arn)
          ]
        }
      ]
  })
}
