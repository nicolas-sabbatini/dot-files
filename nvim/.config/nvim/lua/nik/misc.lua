local crates_status_ok, crates = pcall(require, "crates")
if not crates_status_ok then
  vim.notify("Error loading Crates! misc.lua 3")
  return
end
crates.setup()

local spell_status_ok, spellsitter = pcall(require, "spellsitter")
if not spell_status_ok then
  vim.notify("Error loading Spellsitter! misc.lua 10")
  return
end
spellsitter.setup()

local todo_status_ok, todo = pcall(require, "todo-comments")
if not todo_status_ok then
  vim.notify("Error loading Spellsitter! misc.lua 10")
  return
end
todo.setup()
