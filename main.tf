module "java21" {
  source = "./modules/oci-container"
  providers = {
    apko = apko
    oci  = oci
  }

  repository = "docker.io/firstofth300/jre"
  tag        = "openjdk-21"
  config = {
    contents = {
      packages = [
        "openjdk-21-default-jvm",
        "glibc-locale-en",
        "libstdc++",
      ]
    },
    environment = {
      "LANG" : "en_US.UTF-8",
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm"
    }
    entrypoint = {
      command = "/usr/bin/java"
    }
  }
}

module "java21_dbg" {
  source = "./modules/oci-container"
  providers = {
    apko = apko
    oci  = oci
  }

  repository = "docker.io/firstofth300/jre"
  tag        = "openjdk-21-dbg"
  config = {
    contents = {
      packages = [
        "openjdk-21-default-jvm",
        "glibc-locale-en",
        "libstdc++",
        "bash",
        "curl",
        "less",
        "busybox",
      ]
    },
    environment = {
      "LANG" : "en_US.UTF-8",
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm"
    }
    entrypoint = {
      command = "/usr/bin/java"
    }
  }
}

module "rust" {
  count      = length(local.rust_releases)
  source     = "./modules/oci-container"
  repository = "docker.io/firstofth300/rust"
  tag        = "v${local.rust_releases[count.index]}"
  config = {
    contents = {
      packages = [
        "build-base",
        "rust-${local.rust_releases[count.index]}",
      ]
    },
    entrypoint = {
      command = "/usr/bin/rustc"
    }
  }
}

module "rust_dbg" {
  count      = length(local.rust_releases)
  source     = "./modules/oci-container"
  repository = "docker.io/firstofth300/rust"
  tag        = "v${local.rust_releases[count.index]}-dbg"
  config = {
    contents = {
      packages = [
        "build-base",
        "rust-${local.rust_releases[count.index]}",
        "bash",
        "curl",
        "less",
        "busybox",
      ]
    },
    entrypoint = {
      command = "/usr/bin/rustc"
    }
  }
}
