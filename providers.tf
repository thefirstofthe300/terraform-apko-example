terraform {
  required_providers {
    apko = {
      source  = "chainguard-dev/apko"
      version = "0.21.2"
    }
    oci = {
      source  = "chainguard-dev/oci"
      version = "0.0.18"
    }
  }
}

provider "apko" {
  default_archs      = ["x86_64", "aarch64"]
  extra_repositories = ["https://packages.wolfi.dev/os"]
  extra_keyring      = ["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"]
  extra_packages     = ["wolfi-baselayout"]
}

provider "oci" {}
