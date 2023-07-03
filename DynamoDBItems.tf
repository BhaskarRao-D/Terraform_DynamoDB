resource "aws_dynamodb_table_item" "book_catalog_fiction_items" {
  table_name = aws_dynamodb_table.EmpTable.name
  hash_key   = aws_dynamodb_table.EmpTable.hash_key

  for_each = {
    "BMW" = {
      CarModel = "X1"
      Color    = "Blue"
      Speed    = 320
    }
    "Audi" = {
      CarModel = "A6"
      Color    = "Red"
      Speed    = 360
    }
    "Ferrari" = {
      CarModel = "F8"
      Color    = "Yellow"
      Speed    = 390
    }
    "Tesla" = {
      CarModel = "Model Y"
      Color    = "White"
      Speed    = 330
    }
  }
  item = <<ITEM
 {
    "CarName":  {"S": "${each.key}"},
    "CarModel": {"S": "${each.value.CarModel}"},
    "Color":    {"S": "${each.value.Color}"},
    "Speed":    {"S": "${each.value.Speed}"}
  }
  ITEM
}
