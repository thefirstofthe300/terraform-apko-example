variable "config" {
  type = object({
    contents = object({
      packages = optional(list(string), [])
    }),
    accounts = optional(object({
      groups = list(object({
        groupname = optional(string, "nonroot")
        gid       = optional(number, 65532)
      })),
      users = list(object({
        username = optional(string, "nonroot")
        uid      = optional(number, 65532)
        gid      = optional(number, 65532)
      })),
      run-as = optional(number, 65532)
      }),
      {
        groups = [{
          groupname = "nonroot"
          gid       = 65532
        }],
        users = [{
          username = "nonroot"
          uid      = 65532
          gid      = 65532
        }],
        run-as = 65532
    }),
    work-dir    = optional(string, "/app")
    environment = optional(map(string))
    entrypoint = optional(object({
      command = string
    }))
  })
}

variable "tag" {
  type = string
}

variable "repository" {
  type = string
}
