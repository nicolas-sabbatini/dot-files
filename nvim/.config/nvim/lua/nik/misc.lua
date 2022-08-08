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

local todo_ok, todo = pcall(require, "todo-comments")
if not todo_ok then
  vim.notify("Error loading todo! misc.lua 17")
else
  todo.setup()
end

local project_ok, project = pcall(require, "project_nvim")
if not project_ok then
  vim.notify("Error loading project! misc.lua 24")
else
  project.setup()
end
