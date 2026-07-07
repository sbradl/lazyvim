return {
  {
    "nvim-mini/mini.files",
    opts = {
      options = {
        use_as_default_explorer = true,
      },
      windows = {
        preview = true,
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          vim.keymap.set("n", "A", function()
            local entry = require("mini.files").get_fs_entry()
            if entry == nil then
              vim.notify("No fd entry in mini files", vim.log.levels.WARN)
              return
            end
            local target_dir = entry.path
            if entry.fs_type == "file" then
              target_dir = vim.fn.fnamemodify(entry.path, ":h")
            end
            require("easy-dotnet").create_item(target_dir)
          end, { buffer = buf_id, desc = "Create item" })
        end,
      })
    end,
  },
}
