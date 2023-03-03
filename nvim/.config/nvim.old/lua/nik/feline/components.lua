-- Variables
-- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/groups/integrations/feline.lua
local ok_clrs, palettes = pcall(require, "catppuccin.palettes")
if not ok_clrs then
  vim.notify("Error loading catppuccin palettes!")
  return
end
local ok_ucolors, ucolors = pcall(require, "catppuccin.utils.colors")
if not ok_ucolors then
  vim.notify("Error loading catppuccin utils!")
  return
end
local ok_latte, latte = pcall(require, "catppuccin.palettes.latte")
if not ok_latte then
  vim.notify("Error loading catppuccin latte palette!")
  return
end

local clrs = palettes.get_palette()
local b = vim.b

local assets = {
  left_separator = "",
  right_separator = "",
  bar = "█",
}

local sett = {
  text = ucolors.vary_color({ latte = latte.base }, clrs.surface0),
  bkg = ucolors.vary_color({ latte = latte.crust }, clrs.surface0),
  branch = clrs.rosewater,
  diffs = clrs.mauve,
  extras = clrs.overlay1,
  lsp = clrs.flamingo,
  curr_file = clrs.maroon,
  show_modified = false,
}

local mode_colors = {
  ["n"] = { "NORMAL", clrs.lavender },
  ["no"] = { "N-PENDING", clrs.lavender },
  ["i"] = { "INSERT", clrs.green },
  ["ic"] = { "INSERT", clrs.green },
  ["t"] = { "TERMINAL", clrs.green },
  ["v"] = { "VISUAL", clrs.flamingo },
  ["V"] = { "V-LINE", clrs.flamingo },
  [""] = { "V-BLOCK", clrs.flamingo },
  ["R"] = { "REPLACE", clrs.maroon },
  ["Rv"] = { "V-REPLACE", clrs.maroon },
  ["s"] = { "SELECT", clrs.maroon },
  ["S"] = { "S-LINE", clrs.maroon },
  [""] = { "S-BLOCK", clrs.maroon },
  ["c"] = { "COMMAND", clrs.peach },
  ["cv"] = { "COMMAND", clrs.peach },
  ["ce"] = { "COMMAND", clrs.peach },
  ["r"] = { "PROMPT", clrs.teal },
  ["rm"] = { "MORE", clrs.teal },
  ["r?"] = { "CONFIRM", clrs.mauve },
  ["!"] = { "SHELL", clrs.green },
}

-- Components
local T = {
  vi = {
    provider = function()
      return " " .. mode_colors[vim.fn.mode()][1] .. " "
    end,
    hl = function()
      return {
        fg = sett.text,
        bg = mode_colors[vim.fn.mode()][2],
        style = "bold",
      }
    end,
    left_sep = {
      str = assets.bar,
      hl = function()
        return {
          fg = mode_colors[vim.fn.mode()][2],
          bg = sett.text,
          style = "bold",
        }
      end,
    },
    right_sep = {
      str = assets.right_separator,
      hl = function()
        return {
          fg = mode_colors[vim.fn.mode()][2],
          bg = sett.branch,
          style = "bold",
        }
      end,
    },
  },
  branch = {
    provider = function()
      return b.gitsigns_head or 'NOT IN GIT'
    end,
    hl = {
      fg = sett.text,
      bg = sett.branch,
    },
    icon = " ",
    left_sep = {
      str = assets.bar,
      fg = sett.text,
      bg = sett.branch,
    },
    right_sep = {
      str = assets.right_separator,
      hl = {
        fg = sett.branch,
        bg = sett.diffs,
        style = "bold",
      }
    },
  },
  diff = {
    provider = function()
      if not b.gitsigns_head and not b.gitsigns_status_dict then
        return " "
      end
      local added = b.gitsigns_status_dict["added"] or 0
      local changed = b.gitsigns_status_dict["changed"] or 0
      local removed = b.gitsigns_status_dict["removed"] or 0
      return "  " .. added .. "  " .. changed .. "  " .. removed
    end,
    hl = {
      fg = sett.text,
      bg = sett.diffs,
    },
    left_sep = {
      str = assets.bar,
      fg = sett.text,
      bg = sett.diffs,
    },
    right_sep = {
      str = assets.right_separator,
      hl = {
        fg = sett.diffs,
        bg = sett.text,
        style = "bold",
      }
    },
  },
  line = {
    provider = function()
      local current_line = vim.fn.line(".")
      local total_line = vim.fn.line("$")
      if current_line == 1 then
        return " Top "
      elseif current_line == total_line then
        return " Bot "
      end
      local result, _ = math.modf((current_line / total_line) * 100)
      return " " .. result .. "%% "
    end,
    hl = {
      fg = sett.extras,
      bg = sett.bkg,
    },
  },
  cursor = {
    provider = "position",
    hl = {
      fg = sett.extras,
      bg = sett.bkg,
    },
  },
  workspace_status = {
    provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]
      if Lsp then
        local msg = Lsp.message or ""
        local percentage = Lsp.percentage or 0
        local title = Lsp.title or ""
        local spinners = { "", "", "" }
        local success_icon = { "", "", "" }
        local ms = vim.loop.hrtime() / 1000000
        local frame = math.floor(ms / 120) % #spinners
        if percentage >= 70 then
          return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
        end
        return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
      end
      return ""
    end,
    hl = {
      fg = clrs.rosewater,
      bg = sett.bkg,
    },
  },
  lsp_error = {
    provider = "diagnostic_errors",
    hl = {
      fg = clrs.red,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = {
      str = " ",
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
    }
  },
  lsp_warn = {
    provider = "diagnostic_warnings",
    hl = {
      fg = clrs.yellow,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = {
      str = " ",
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
    }
  },
  lsp_info = {
    provider = "diagnostic_info",
    hl = {
      fg = clrs.sky,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = {
      str = " ",
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
    }
  },
  lsp_hints = {
    provider = "diagnostic_hints",
    hl = {
      fg = clrs.rosewater,
      bg = sett.bkg,
    },
    icon = "  ",
    right_sep = {
      str = " ",
      hl = {
        fg = sett.extras,
        bg = sett.bkg,
      },
    }
  },
  treesitter = {
    provider = function()
      local current_buffer = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[current_buffer] or {}) then
        return ""
      end
      return " "
    end,
    hl = {
      fg = sett.text,
      bg = sett.lsp,
    },
    left_sep = {
      str = assets.left_separator,
      hl = {
        fg = sett.lsp,
        bg = sett.bkg,
      },
    },
  },
  lsp_names = {
    provider = function()
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients or {}) == nil then
        return "LSP Inactive "
      end
      local lsp_names = {}
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(lsp_names, client.name)
        end
      end
      return " " .. table.concat(lsp_names, ", ") .. " "
    end,
    hl = {
      fg = sett.text,
      bg = sett.lsp,
    },
  },
  file = {
    provider = function()
      local filename = vim.fn.expand("%:t")
      local extension = vim.fn.expand("%:e")
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
        icon = "  "
        return icon
      end
      return (sett.show_modified and "%m" or "") .. " " .. icon .. " "
    end,
    hl = {
      fg = sett.text,
      bg = sett.curr_file,
    },
    left_sep = {
      str = assets.left_separator,
      hl = {
        fg = sett.curr_file,
        bg = sett.lsp,
      },
    },
  },
}

return T
