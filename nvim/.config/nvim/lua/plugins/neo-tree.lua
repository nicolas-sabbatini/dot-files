return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["Y"] = "copy_absolute_path",
          ["y"] = "copy_relative_from_root_path",
        },
      },
      commands = {
        copy_absolute_path = function(state)
          local node = state.tree:get_node()
          vim.call("setreg", "*", node.path)
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
          vim.call("setreg", "*", relative_path)
        end,
      },
    },
  },
}
