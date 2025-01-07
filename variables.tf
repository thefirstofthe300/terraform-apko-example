locals {
  rust_releases = [for i in range(0, 5) : "1.${split(".", data.github_release.rust.release_tag)[1] - i}"]
}
