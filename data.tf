data "github_release" "rust" {
  repository  = "rust"
  owner       = "rust-lang"
  retrieve_by = "latest"
}
