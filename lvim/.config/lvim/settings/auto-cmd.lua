lvim.autocommands = {
  {
    "BufWritePost",
    {
      pattern = { "plugins.lua" },
      command = "source <afile> | LvimReload",
    }
  },
  {
    "BufReadPost",
    {
      pattern = { "*" },
      command = "normal zR",
    }
  },
  {
    "FileReadPost",
    {
      pattern = { "*" },
      command = "normal zR",
    }
  },
}
