data "local_file" "db_users_data" {
  filename = "iamusers.json"
}

locals {
  users = jsondecode(data.local_file.db_users_data.content)["users"]
}
data "aws_s3_bucket_object" "check_file" {
  bucket = "onewonder-tfstate"
  key    = "github/iamusers.json"
}
