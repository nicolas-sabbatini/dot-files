return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["y"] = "copy_name",
          ["Y"] = "copy_relative_from_root_path",
          ["l"] = "open",
        },
      },
      commands = {
        copy_name = function(state)
          local node = state.tree:get_node()
          ---@diagnostic disable-next-line: param-type-mismatch
          vim.call("setreg", "+", node.name)
          vim.notify('Copied "' .. node.name .. '" to clipboard', "info", { title = "NeoTree" })
        end,
        copy_absolute_path = function(state)
          local node = state.tree:get_node()
          ---@diagnostic disable-next-line: param-type-mismatch
          vim.call("setreg", "+", node.path)
          vim.notify('Copied "' .. node.path .. '" to clipboard', "info", { title = "NeoTree" })
        end,
        copy_relative_from_root_path = function(state)
          local node = state.tree:get_node()
          local path = node.path
          local path_split = {}
          for str in string.gmatch(path, string.format("([^%s]+)", "/")) do
            table.insert(path_split, str)
          end
          local relative_path = "."
          for i = #path_split - node.level + 1, #path_split, 1 do
            relative_path = relative_path .. "/" .. path_split[i]
          end
          ---@diagnostic disable-next-line: param-type-mismatch
          vim.call("setreg", "+", relative_path)
          vim.notify('Copied "' .. relative_path .. '" to clipboard', "info", { title = "NeoTree" })
        end,
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
        },
      },
    },
  },
}
