resource "aws_dynamodb_table" "EmpTable" {
  name           = "EmpData"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "CarName"

  attribute {
    name = "CarName"
    type = "S"
  }

  attribute {
    name = "Speed"
    type = "S"
  }
  global_secondary_index {
    name               = "Speed-Index"
    hash_key           = "Speed"
    write_capacity     = 1
    read_capacity      = 1
    projection_type    = "INCLUDE"
    non_key_attributes = ["Genre"]
  }
}
