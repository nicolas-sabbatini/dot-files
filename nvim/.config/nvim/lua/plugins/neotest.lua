return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-go",
    },
    opts = { adapters = { "neotest-jest", "neotest-go" } },
  },
}
