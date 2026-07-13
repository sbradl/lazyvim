return {
  {
    "nvim-mini/mini.files",
    opts = {
      options = {
        use_as_default_explorer = true,
      },
      windows = {
        max_number = math.huge,
        preview = true,
        width_preview = 120,
        width_focus = 50,
        width_nofocus = 50,
      },
      mappings = {
        close = "<esc>",
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      local map_split = function(buf_id, lhs, direction)
        local rhs = function()
          local new_target_window
          local cur_target_window = require("mini.files").get_explorer_state().target_window
          if cur_target_window ~= nil then
            vim.api.nvim_win_call(cur_target_window, function()
              vim.cmd("belowright " .. direction .. " split")
              new_target_window = vim.api.nvim_get_current_win()
            end)

            require("mini.files").set_target_window(new_target_window)
            require("mini.files").go_in({ close_on_file = true })
          end
        end

        vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Open in " .. direction .. " split" })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id

          map_split(buf_id, "<C-w>s", "horizontal")
          map_split(buf_id, "<C-w>v", "vertical")
        end,
      })
    end,
  },
}
