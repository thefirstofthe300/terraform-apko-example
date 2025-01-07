data "apko_config" "this" {
  config_contents = jsonencode(var.config)
}
