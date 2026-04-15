---@type overseer.TemplateFileDefinition
return {
  name = "Dotnet Test",
  builder = function()
    local dir = vim.fn.expand("%:p:h")

    local csproj = vim.fs.dirname(vim.fs.find(function(name)
      return name:match(".*%.csproj")
    end, { path = dir, limit = 1, upward = true, type = "file" })[1])

    return {
      cmd = { "dotnet" },
      args = { "test", "--no-restore" },
      cwd = csproj,
      components = { "default" },
    }
  end,
  condition = {
    filetype = { "cs" },
  },
}
