resource "apko_build" "this" {
  repo   = var.repository
  config = data.apko_config.this.config
}

resource "oci_tag" "this" {
  digest_ref = apko_build.this.sboms.index.digest
  tag        = var.tag
}
