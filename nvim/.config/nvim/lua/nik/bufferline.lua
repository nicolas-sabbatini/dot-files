local bl_status_ok, bl = pcall(require, "bufferline")
if not bl_status_ok then
  vim.notify("Error loading Bufferline! bufferline.lua 3")
  return
end

bl.setup {
  highlights = {
    background = {
      italic = true,
    },
    buffer_selected = {
      bold = true,
    },
  },
  options = {
    numbers = "none",
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
      -- remove extension from files
      return vim.fn.fnamemodify(buf.name, ":t:r")
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "false",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = nil,
    custom_filter = nil,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "PanelHeading",
        padding = 1,
      },
      {
        filetype = "packer",
        text = "Packer",
        highlight = "PanelHeading",
        padding = 1,
      },
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "insert_at_end",
  },
}
