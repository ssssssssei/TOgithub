resource "aws_iam_user" "db_users" {
  # 使用 user 作为唯一键
  for_each = {
    for user_data in local.users : user_data.user => {
      user   = user_data.user
    }
  }

  # IAM 用户名称
  name = each.key

  # IAM 用户标签
  tags = {
    Role = each.value.user
  }
}