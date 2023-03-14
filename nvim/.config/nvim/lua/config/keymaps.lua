vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume telescope section" }
)
------------------- crates.nvim -------------------
vim.keymap.set("n", "<leader>cc", "+crates.nvim", { noremap = true, silent = true, desc = "+cargo" })
local function crates_popup(callback)
  return function()
    local c = require("crates")
    c[callback]()
    c.focus_popup()
  end
end
-- Reload
vim.keymap.set("n", "<leader>cct", require("crates").toggle, { noremap = true, silent = true, desc = "crates toggle" })
vim.keymap.set("n", "<leader>ccr", require("crates").reload, { noremap = true, silent = true, desc = "crates reload" })
-- Show popups
vim.keymap.set(
  "n",
  "<leader>ccv",
  crates_popup("show_versions_popup"),
  { noremap = true, silent = true, desc = "show versions" }
)
vim.keymap.set("n", "<leader>ccp", crates_popup("show_popup"), { noremap = true, silent = true, desc = "show popup" })
vim.keymap.set(
  "n",
  "<leader>ccf",
  crates_popup("show_features_popup"),
  { noremap = true, silent = true, desc = "show fetures" }
)
-- Updates
vim.keymap.set(
  "n",
  "<leader>ccu",
  require("crates").upgrade_crate,
  { noremap = true, silent = true, desc = "update crate" }
)
vim.keymap.set(
  "n",
  "<leader>ccU",
  require("crates").upgrade_all_crates,
  { noremap = true, silent = true, desc = "update ALL carates" }
)
-- Externals
vim.keymap.set(
  "n",
  "<leader>ccd",
  require("crates").open_documentation,
  { noremap = true, silent = true, desc = "open documentation" }
)
------------------- crates.nvim -------------------
