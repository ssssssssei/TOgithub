data "local_file" "db_users_data" {
  filename = "iamusers.json"
}

locals {
  users = jsondecode(data.local_file.db_users_data.content)["users"]
}