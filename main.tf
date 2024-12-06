resource "aws_iam_user" "db_users" {
  for_each = {
    for user in local.users : user => {
      user = user
      key  = "${user}-iam"
    }
  }

  name = each.value.key

  tags = {
    "Role" = each.value.user
  }
}
resource "aws_s3_object" "existing_file" {
  bucket = "onewonder-tfstate"
  key    = "github/iamusers.json"
}
