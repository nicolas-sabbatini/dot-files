local crates_ok, crates = pcall(require, "crates")
if not crates_ok then
  vim.notify("Error loading Crates! misc.lua 3")
else
  crates.setup()
end

local spell_ok, spellsitter = pcall(require, "spellsitter")
if not spell_ok then
  vim.notify("Error loading Spellsitter! misc.lua 10")
else
  spellsitter.setup()
end

local project_ok, project = pcall(require, "project_nvim")
if not project_ok then
  vim.notify("Error loading project! misc.lua 17")
else
  project.setup()
end

local colorizer_ok, colorizer = pcall(require, "colorizer")
if not colorizer_ok then
  vim.notify("Error loading colorizer! misc.lua 24")
else
  colorizer.setup()
end
